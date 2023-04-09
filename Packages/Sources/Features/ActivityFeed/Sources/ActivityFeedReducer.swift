import Casimir
import ComposableArchitecture
import Composables
import Foundation
import Octokit
// import OctokitLive // TODO: importing implementations in features should not be possible, check in rest of the project

public struct ActivityFeedReducer: ComposableReducer {
  public struct State: ComposableState {
    internal let user: Octokit.User
    internal var publicEvents: LoadableData<IdentifiedArrayOf<Octokit.Event>>

    public init(
      user: Octokit.User,
      publicEvents: LoadableData<IdentifiedArrayOf<Octokit.Event>>
    ) {
      self.user = user
      self.publicEvents = publicEvents
    }
  }

  public enum Action: ComposableAction {
    public enum User: Equatable {
      case lifecycle
    }

    public enum Local: Equatable {
      case _remoteReturnedUserPublicEvents(Result<[Octokit.Event], Octokit.NetworkServiceError>)
    }

    public enum Delegate: Equatable {}

    case user(User)
    case local(Local)
    case delegate(Delegate)
  }

  private let userService: Octokit.UserService

  public init(
    userService: Octokit.UserService
  ) {
    self.userService = userService
  }

  public var body: some ReducerProtocolOf<Self> {
    Reduce<State, Action> { state, action in
      switch action {
      case .user(.lifecycle):
        return .task { [login = state.user.login] in
          .local(
            ._remoteReturnedUserPublicEvents(
              await userService.events(
                username: login,
                page: 0
              )
            )
          )
        }

      case .local(._remoteReturnedUserPublicEvents(.success(let events))):
        state.publicEvents = .loaded(IdentifiedArrayOf(uniqueElements: events))
        return .none

      case .local(._remoteReturnedUserPublicEvents(.failure(let error))):
        state.publicEvents = .failure(error)
        return .none

      case .user, .delegate:
        return .none
      }
    }
  }
}
