import Casimir
import ComposableArchitecture
import Foundation
import Octokit
import ReleaseDetailsFeature

public struct EventsListReducer: ReducerProtocol {
  public struct State: Equatable {
    public var events: Loadable<IdentifiedArrayOf<Octokit.Event>> = .loading
    @PresentationState internal var navigation: Navigation.State?
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
      //      case userRequestedReleaseDetails(_ event: Octokit.Event.ReleaseEvent)
    }

    case user(User)
    case local(Local)
    case delegate(Delegate)
    case _navigation(PresentationAction<Navigation.Action>)
  }

  public init() {}

  public var body: some ReducerProtocolOf<Self> {
    Reduce<State, Action> { state, action in
      switch action {
      case .user(.userClickedOnEvent(.commitCommentEvent(let event))):
        return .none
      case .user(.userClickedOnEvent(.createEvent(let event))):
        return .none
      case .user(.userClickedOnEvent(.deleteEvent(let event))):
        return .none
      case .user(.userClickedOnEvent(.forkEvent(let event))):
        return .none
      case .user(.userClickedOnEvent(.gollumEvent(let event))):
        return .none
      case .user(.userClickedOnEvent(.issueCommentEvent(let event))):
        return .none
      case .user(.userClickedOnEvent(.issuesEvent(let event))):
        return .none
      case .user(.userClickedOnEvent(.memberEvent(let event))):
        return .none
      case .user(.userClickedOnEvent(.publicEvent(let event))):
        return .none
      case .user(.userClickedOnEvent(.pullRequestEvent(let event))):
        return .none
      case .user(.userClickedOnEvent(.pushEvent(let event))):
        return .none
      case .user(.userClickedOnEvent(.releaseEvent(let event))):
        state.navigation = .releaseDetails(.init(release: event))
        return .none
      case .user(.userClickedOnEvent(.sponsorshipEvent(let event))):
        return .none
      case .user(.userClickedOnEvent(.watchEvent(let event))):
        return .none
      case .local:
        return .none
      case .delegate:
        return .none
      case ._navigation:
        return .none
      }
    }

    .ifLet(\.$navigation, action: /Action._navigation) {
      EventsListReducer.Navigation()
    }
  }
}
