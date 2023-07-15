import Casimir
import ComposableArchitecture
import EventsListFeature
import Foundation
import Octokit
import ReleaseDetailsFeature

public struct ActivityFeedReducer: ReducerProtocol {
  public struct State: Equatable {
    internal let user: Octokit.User
    internal var eventsList = EventsListReducer.State()
    @PresentationState internal var navigation: Navigation.State?

    public init(
      user: Octokit.User
    ) {
      self.user = user
    }
  }

  public enum Action: Equatable {
    public enum User: Equatable {
      case userNavigatedToActivityFeed
    }

    public enum Local: Equatable {
      case _remoteReturnedUserEvents(TaskResult<[Octokit.Event]>)
    }

    public enum Delegate: Equatable {}

    case user(User)
    case local(Local)
    case delegate(Delegate)

    case _navigation(PresentationAction<Navigation.Action>) // TODO: remove
    case eventsList(EventsListReducer.Action)
  }

  @Dependency(\.eventsService)
  private var eventsService: Octokit.EventsService

  public init() {}

  public var body: some ReducerProtocolOf<Self> {
    Reduce<State, Action> { state, action in
      switch action {
      case .user(.userNavigatedToActivityFeed):
        return .run { [username = state.user.login, eventsList = state.eventsList.events] send in
          if eventsList.isNotLoaded {
            await send(
              .local(
                ._remoteReturnedUserEvents(
                  TaskResult {
                    try await eventsService.userEvents(
                      username,
                      0
                    )
                  }
                )
              ),
              animation: .default
            )
          }
        }

      case .local(._remoteReturnedUserEvents(.success(let events))):
        state.eventsList.events = .loaded(.init(uniqueElements: events))
        return .none

      case .local(._remoteReturnedUserEvents(.failure(let error))):
        state.eventsList.events = .failure(error)
        return .none

      case .delegate:
        return .none

      case ._navigation:
        return .none

      //      case .eventsList(.delegate(.userRequestedReleaseDetails(let event))):
      //        state.navigation = .releaseDetails(.init(release: event))
      //        return .none

      case .eventsList:
        return .none
      }
    }
    .ifLet(
      \.$navigation,
      action: /Action._navigation
    ) {
      ActivityFeedReducer.Navigation()
    }

    Scope(
      state: \.eventsList,
      action: /Action.eventsList
    ) {
      EventsListReducer()
    }
  }
}
