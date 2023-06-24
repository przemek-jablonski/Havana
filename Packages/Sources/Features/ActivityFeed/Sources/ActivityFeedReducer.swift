import Casimir
import ComposableArchitecture
import Foundation
import Octokit
// import OctokitLive // TODO: importing implementations in features should not be possible, check in rest of the project

public struct ActivityFeedReducer: ReducerProtocol {
  public struct State: Equatable {
    internal let user: Octokit.User
    internal var publicEvents: Loadable<IdentifiedArrayOf<Octokit.Event>>

    public init(
      user: Octokit.User,
      publicEvents: Loadable<IdentifiedArrayOf<Octokit.Event>>
    ) {
      self.user = user
      self.publicEvents = publicEvents
    }
  }

  public enum Action: Equatable {
    public enum User: Equatable {
      case task
    }

    public enum Local: Equatable {
      case _remoteReturnedUserPublicEvents(TaskResult<[Octokit.Event]>)
    }

    public enum Delegate: Equatable {}

    case user(User)
    case local(Local)
    case delegate(Delegate)
  }

  @Dependency(\.userService)
  private var userService: Octokit.UserService

  public init() {}

  public var body: some ReducerProtocolOf<Self> {
    Reduce<State, Action> { state, action in
      switch action {
      case .user(.task):
        return .none
      //          return .run { send in
      //            send(
      //              .local(
      //                ._remoteReturnedUserPublicEvents(
      //                  await userService.events(
      //                    username: login,
      //                    page: 0
      //                  )
      //                )
      //              )
      //            )
      //          }
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
