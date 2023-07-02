import Casimir
import ComposableArchitecture
import Foundation
import Octokit

public struct ActivityFeedReducer: ReducerProtocol {
  public struct State: Equatable {
    internal let user: Octokit.User
    internal var publicEvents: Loadable<IdentifiedArrayOf<Octokit.Event>> = .loading

    internal var test: Loadable<[Octokit.Event]> = .loading

    public init(
      user: Octokit.User
    ) {
      self.user = user
      self.publicEvents = .loading
    }
  }

  public enum Action: Equatable {
    public enum User: Equatable {
      case userNavigatedToActivityFeed
      case userRequestedReleaseDetails(_ release: Octokit.Event.ReleaseEvent.ID)
      case userRequestedRepositoryDetails(_ repository: Octokit.Event.Repository.ID)
      case userRequestedActorDetails(_ actor: Octokit.Event.Actor.ID)
      case userRequestedRepositoryStarred(_ repository: Octokit.Event.Repository.ID)
    }

    public enum Local: Equatable {
      case _remoteReturnedUserPublicEvents(TaskResult<[Octokit.Event]>)
    }

    public enum Delegate: Equatable {
      case userRequestedReleaseDetails(_ release: Octokit.Event.ReleaseEvent.ID)
      case userRequestedRepositoryDetails(_ repository: Octokit.Event.Repository.ID)
      case userRequestedActorDetails(_ actor: Octokit.Event.Actor.ID)
      case userRequestedRepositoryStarred(_ repository: Octokit.Event.Repository.ID)
    }

    case user(User)
    case local(Local)
    case delegate(Delegate)
  }

  @Dependency(\.eventsService) private var eventsService: Octokit.EventsService

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
            ),
            animation: .default
          )
        }

      case .user(.userRequestedReleaseDetails(let release)):
        return .send(.delegate(.userRequestedReleaseDetails(release)))

      case .user(.userRequestedRepositoryDetails(let repository)):
        return .send(.delegate(.userRequestedRepositoryDetails(repository)))

      case .user(.userRequestedActorDetails(let actor)):
        return .send(.delegate(.userRequestedActorDetails(actor)))

      // TODO: handle starring the repository
      case .user(.userRequestedRepositoryStarred(let repository)):
        return .none

      case .local(._remoteReturnedUserPublicEvents(.success(let events))):
        state.publicEvents = .loaded(.init(uniqueElements: events))
        return .none

      case .local(._remoteReturnedUserPublicEvents(.failure(let error))):
        state.publicEvents = .failure(error)
        return .none

      case .delegate:
        return .none
      }
    }
  }
}
