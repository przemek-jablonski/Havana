import ActivityFeedFeature
import ComposableArchitecture
import Composables
import Foundation
import Octokit

public struct UserContextReducer: ComposableReducer {
  public struct State: ComposableState {
    public enum Tab: Int, Equatable {
      case activity
    }

    internal var activityFeed: ActivityFeedReducer.State?
    internal var selectedTab: Tab

    public init(
      activityFeed: ActivityFeedReducer.State? = nil,
      selectedTab: UserContextReducer.State.Tab = .activity
    ) {
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
      case .user(.switchedTab(.activity)), .user(.lifecycle):
        state.activityFeed = ActivityFeedReducer.State(publicEvents: .loading)
        return .none
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
