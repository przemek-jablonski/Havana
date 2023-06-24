import Casimir
import ComposableArchitecture
import Foundation
import Octokit

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
      case userNavigatedToActivityFeed
    }

    public enum Local: Equatable {
      case _remoteReturnedUserPublicEvents(TaskResult<[Octokit.Event]>)
    }

    public enum Delegate: Equatable {}

    case user(User)
    case local(Local)
    case delegate(Delegate)
  }

  @Dependency(\.eventsService)
  private var eventsService: Octokit.EventsService

  public init() {}

  public var body: some ReducerProtocolOf<Self> {
    Reduce<State, Action> { state, action in
      switch action {
      case .user(.userNavigatedToActivityFeed):
        return .run { [username = state.user.login] send in
          await send(
            .local(
              ._remoteReturnedUserPublicEvents(
                TaskResult {
                  try await eventsService.userEvents(
                    username,
                    0
                  )
                }
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
