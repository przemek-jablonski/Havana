import Casimir
import ComposableArchitecture
import Foundation
import Octokit
import ReleaseDetailsFeature

public struct EventsListReducer: ReducerProtocol {
  public struct State: Equatable {
    public var events: Loadable<IdentifiedArrayOf<Octokit.Event>> = .loading
    public init() {}
  }

  public enum Action: Equatable {
    public enum User: Equatable {
      case userClickedOnEvent(_ event: Octokit.Event)
      //      case userRequestedReleaseDetails(_ event: Octokit.Event.ReleaseEvent)
      //      case userRequestedRepositoryDetails(_ repository: Octokit.Event.Repository)
      //      case userRequestedActorDetails(_ actor: Octokit.Event.Actor)
      //      case userRequestedRepositoryStarred(_ repositoryId: Octokit.Event.Repository.ID)
    }

    public enum Local: Equatable {}

    public enum Delegate: Equatable {
      case userClickedOnEvent(_ event: Octokit.Event)
      //      case userRequestedReleaseDetails(_ event: Octokit.Event.ReleaseEvent)
    }

    case user(User)
    case local(Local)
    case delegate(Delegate)
  }

  public init() {}

  public var body: some ReducerProtocolOf<Self> {
    Reduce<State, Action> { _, action in
      switch action {
      case .user(.userClickedOnEvent(let event)):
        return .run { send in
          await send(
            .delegate(
              .userClickedOnEvent(
                event
              )
            )
          )
        }
      case .local:
        return .none
      case .delegate:
        return .none
      }
    }
  }
}
