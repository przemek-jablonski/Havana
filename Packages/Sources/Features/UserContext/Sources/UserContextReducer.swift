import ActivityFeedFeature
import Casimir
import ComposableArchitecture
import Composables
import Foundation
import Octokit

public struct UserContextReducer: ComposableReducer {
  public struct State: ComposableState {
    public enum Tab: Int, Equatable {
      case activity
    }

    internal var user: LoadableDataOf<Octokit.User>
    internal var activityFeed: ActivityFeedReducer.State?
    internal var selectedTab: Tab

    public init(
      user: LoadableDataOf<Octokit.User> = .loading,
      activityFeed: ActivityFeedReducer.State? = nil,
      selectedTab: UserContextReducer.State.Tab = .activity
    ) {
      self.user = user
      self.activityFeed = activityFeed
      self.selectedTab = selectedTab
    }
  }

  public enum Action: ComposableAction {
    public enum User: Equatable {
      case lifecycle
      case switchedTab(State.Tab)
    }

    public enum Local: Equatable {}

    public enum Delegate: Equatable {}

    case user(User)
    case local(Local)
    case delegate(Delegate)

    case activityFeed(ActivityFeedReducer.Action)
  }

  public init() {}

  public var body: some ReducerProtocolOf<Self> {
    Reduce<State, Action> { state, action in
      switch action {
        case .user(.lifecycle):
          return .none
      case .user(.switchedTab(.activity)):
          return .none
//        state.activityFeed = ActivityFeedReducer.State(publicEvents: .loading)
      case .local, .delegate:
        return .none
      case .activityFeed:
        return .none
      }
    }
    .ifLet(
      \.activityFeed,
      action: /Action.activityFeed
    ) {
      ActivityFeedReducer(
        userService: Octokit.UserServiceMock.happyPath()
      )
    }
  }
}
