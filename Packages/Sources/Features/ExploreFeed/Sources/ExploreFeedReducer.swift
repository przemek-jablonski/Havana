import ComposableArchitecture
import EventsListFeature
import Foundation
import Octokit

public struct ExploreFeedReducer: ReducerProtocol {
  public struct State: Equatable {
    internal var eventsList = EventsListReducer.State()
    public init() {}
  }

  public enum Action: Equatable {
    public enum User: Equatable {
      case userNavigatedToExploreFeed
    }

    public enum Local: Equatable {
      case _remoteReturnedGlobalEvents(TaskResult<[Octokit.Event]>)
    }

    public enum Delegate: Equatable {}

    case user(User)
    case local(Local)
    case delegate(Delegate)

    case eventsList(EventsListReducer.Action)
  }

  @Dependency(\.eventsService)
  private var eventsService: Octokit.EventsService

  public init() {}

  public var body: some ReducerProtocolOf<Self> {
    Reduce<State, Action> { state, action in
      switch action {
      case .user(.userNavigatedToExploreFeed):
        return .run { [eventsList = state.eventsList.events] send in
          if eventsList.isNotLoaded {
            await send(
              .local(
                ._remoteReturnedGlobalEvents(
                  TaskResult {
                    try await eventsService.allPublicEvents(0)
                  }
                )
              )
            )
          }
        }

      case .local(._remoteReturnedGlobalEvents(.success(let events))):
        state.eventsList.events = .loaded(.init(uniqueElements: events))
        return .none

      case .local(._remoteReturnedGlobalEvents(.failure(let error))):
        state.eventsList.events = .failure(error)
        return .none

      case .delegate:
        return .none

      case .eventsList:
        return .none
      }
    }

    Scope(
      state: \.eventsList,
      action: /Action.eventsList
    ) {
      EventsListReducer()
    }
  }
}
