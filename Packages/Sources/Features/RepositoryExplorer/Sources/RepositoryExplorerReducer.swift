import Casimir
import ComposableArchitecture
import Foundation
import Octokit

public struct RepositoryExplorerReducer: ReducerProtocol {
  public struct State: Equatable {
    internal var repository: Octokit.Repository
    internal var contents: Loadable<[Octokit.Repository.Entity]> = .loading

    public init(
      repository: Octokit.Repository
    ) {
      self.repository = repository
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
  }

  public init() {}

  @Dependency(\.repositoryService)
  private var repositoryService: Octokit.RepositoryService

  public var body: some ReducerProtocolOf<Self> {
    Reduce<State, Action> { state, action in
      switch action {
      case .user(.userNavigatedToRepositoryExplorer):
        return .run { [repository = state.repository] send in
          await send(
            .local(
              ._remoteReturnedRepositoryContents(
                TaskResult {
                  try await repositoryService.content(repository.fullName, "/")
                }
              )
            )
          )
        }

      case .user(.userRequestedContentsOf(let entity)):
        return .none

      case .local(._remoteReturnedRepositoryContents(.success(let contents))):
        state.contents = .loaded(contents)
        return .none

      case .local(._remoteReturnedRepositoryContents(.failure(let error))):
        state.contents = .failure(error)
        return .none
      }
    }
  }
}
