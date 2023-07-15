import Casimir
import ComposableArchitecture
import Foundation
import Octokit

public struct RepositoryReducer: ReducerProtocol {
  public struct State: Equatable {
    internal var repository: Loadable<Octokit.Repository>
    internal let fullName: String
    internal let displayName: String?

    public init(
      fullName: String,
      displayName: String
    ) {
      self.fullName = fullName
      self.displayName = displayName
      self.repository = .loading
    }
  }

  public enum Action: Equatable {
    public enum User: Equatable {
      case userNavigatedToRepositoryView
    }

    public enum Local: Equatable {
      case _remoteReturnedRepository(TaskResult<Octokit.Repository>)
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
      case .user(.userNavigatedToRepositoryView):
        return .run { [fullName = state.fullName] send in
          await send(
            .local(
              ._remoteReturnedRepository(
                TaskResult {
                  try await repositoryService.repository(
                    fullName
                  )
                }
              )
            )
          )
        }

      case .local(._remoteReturnedRepository(.success(let repository))):
        state.repository = .loaded(repository)
        return .none

      case .local(._remoteReturnedRepository(.failure(let error))):
        state.repository = .failure(error)
        return .none
      }
    }
  }
}
