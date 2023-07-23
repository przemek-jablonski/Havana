import Casimir
import ComposableArchitecture
import Foundation
import Octokit

public struct RepositoryExplorerReducer: ReducerProtocol {
  public struct State: Equatable {
    internal var repository: Octokit.Repository
    internal var path: String
    internal var contents: Loadable<[Octokit.Repository.Entity]> = .loading
    @PresentationState internal var repositoryExplorer: RepositoryExplorerReducer.State?

    public init(
      repository: Octokit.Repository,
      path: String
    ) {
      self.repository = repository
      self.path = path
    }
  }

  public enum Action: Equatable {
    public enum User: Equatable {
      case userNavigatedToRepositoryExplorer
      case userRequestedContentsOf(_ entity: Octokit.Repository.Entity)
    }

    public enum Local: Equatable {
      case _remoteReturnedRepositoryContents(TaskResult<[Octokit.Repository.Entity]>)
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
      case .user(.userNavigatedToRepositoryExplorer):
        return .run { [repository = state.repository, path = state.path] send in
          await send(
            .local(
              ._remoteReturnedRepositoryContents(
                TaskResult {
                  try await repositoryService.content(
                    repository.fullName,
                    path
                  )
                }
              )
            )
          )
        }

      case .user(.userRequestedContentsOf(let entity)):
        state.repositoryExplorer = .init(
          repository: state.repository,
          path: entity.path
        )
        return .none

      case .local(._remoteReturnedRepositoryContents(.success(let contents))):
        state.contents = .loaded(contents)
        return .none

      case .local(._remoteReturnedRepositoryContents(.failure(let error))):
        state.contents = .failure(error)
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
