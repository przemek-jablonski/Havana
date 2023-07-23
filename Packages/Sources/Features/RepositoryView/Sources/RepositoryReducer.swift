import Casimir
import ComposableArchitecture
import Foundation
import Octokit
import RepositoryExplorerFeature

public struct RepositoryReducer: ReducerProtocol {
  public struct State: Equatable {
    internal let fullName: String
    internal let displayName: String?
    internal var repository: Loadable<Octokit.Repository>
    internal var readme: Loadable<Octokit.Repository.Readme>
    internal var languages: Loadable<[Octokit.Repository.Language]>
    @PresentationState internal var repositoryExplorer: RepositoryExplorerReducer.State?

    public init(
      fullName: String,
      displayName: String
    ) {
      self.fullName = fullName
      self.displayName = displayName
      self.repository = .loading
      self.readme = .loading
      self.languages = .loading
    }
  }

  public enum Action: Equatable {
    public enum User: Equatable {
      case userNavigatedToRepositoryView
      case userRequestedRepositoryFiles
    }

    public enum Local: Equatable {
      case _remoteReturnedRepository(TaskResult<Octokit.Repository>)
      case _remoteReturnedRepositoryReadme(TaskResult<Octokit.Repository.Readme>)
      case _remoteReturnedRepositoryLanguages(TaskResult<[Octokit.Repository.Language]>)
    }

    public enum Delegate: Equatable {}

    case user(User)
    case local(Local)
    case delegate(Delegate)
    case _repositoryExplorer(PresentationAction<RepositoryExplorerReducer.Action>)
  }

  public init() {}

  @Dependency(\.repositoryService)
  private var repositoryService: Octokit.RepositoryService

  public var body: some ReducerProtocolOf<Self> {
    Reduce<State, Action> { state, action in
      switch action {
      case .user(.userNavigatedToRepositoryView):
        return .merge(
          .run { [fullName = state.fullName] send in
            await send(
              .local(
                ._remoteReturnedRepository(
                  TaskResult {
                    try await repositoryService.repository(fullName)
                  }
                )
              )
            )
          },
          .run { [fullName = state.fullName] send in
            await send(
              .local(
                ._remoteReturnedRepositoryReadme(
                  TaskResult {
                    try await repositoryService.readme(fullName)
                  }
                )
              )
            )
          },
          .run { [fullName = state.fullName] send in
            await send(
              .local(
                ._remoteReturnedRepositoryLanguages(
                  TaskResult {
                    try await repositoryService.languages(fullName)
                  }
                )
              )
            )
          }
        )

      case .user(.userRequestedRepositoryFiles):
        if let repository = state.repository.loaded() {
          state.repositoryExplorer = .init(repository: repository, path: "/")
        } else {
          // TODO: LOG ERROR
        }
        return .none

      case .local(._remoteReturnedRepository(let result)):
        switch result {
        case .success(let repository):
          state.repository = .loaded(repository)
        case .failure(let error):
          state.repository = .failure(error)
        }
        return .none

      case .local(._remoteReturnedRepositoryReadme(let result)):
        switch result {
        case .success(let readme):
          state.readme = .loaded(readme)
        case .failure(let error):
          state.readme = .failure(error)
        }
        return .none

      case .local(._remoteReturnedRepositoryLanguages(let result)):
        switch result {
        case .success(let languages):
          state.languages = .loaded(languages)
        case .failure(let error):
          state.languages = .failure(error)
        }
        return .none

      case ._repositoryExplorer:
        return .none
      }
    }
    .ifLet(
      \.$repositoryExplorer,
      action: /Action._repositoryExplorer
    ) {
      RepositoryExplorerReducer()
    }
  }
}

// TODO: Cancellation
// TODO: retrying
