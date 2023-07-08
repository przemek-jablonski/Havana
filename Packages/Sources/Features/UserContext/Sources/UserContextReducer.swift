import ActivityFeedFeature
import Casimir
import ComposableArchitecture
import ExploreFeedFeature
import Foundation
import Octokit

// TODO: here add user display
public struct UserContextReducer: ReducerProtocol {
  public struct State: Equatable {
    public enum Tab: Int, Equatable {
      case explore
      case activity
    }

    internal var user: Loadable<Octokit.User> = .loading
    internal var activityFeed: ActivityFeedReducer.State?
    internal var exploreFeed: ExploreFeedReducer.State?
    internal var selectedTab: Tab

    public init(
      selectedTab: UserContextReducer.State.Tab = .activity
    ) {
      self.selectedTab = selectedTab
    }
  }

  public enum Action: Equatable {
    public enum User: Equatable {
      case userNavigatedToUserContext
      case userSwitchedTab(State.Tab)
    }

    public enum Local: Equatable {
      case _remoteReturnedUserDataResponse(TaskResult<Octokit.User>)
    }

    public enum Delegate: Equatable {}
    case user(User)
    case local(Local)
    case delegate(Delegate)

    case activityFeed(ActivityFeedReducer.Action)
    case exploreFeed(ExploreFeedReducer.Action)
  }

  @Dependency(\.userService)
  private var userService: Octokit.UserService

  public init() {}

  public var body: some ReducerProtocolOf<Self> {
    Reduce<State, Action> { state, action in
      switch action {
      case .user(.userNavigatedToUserContext):
        state.user = .loading
        return .run { send in
          await send(
            .local(
              ._remoteReturnedUserDataResponse(
                TaskResult {
                  try await userService.user()
                }
              )
            )
          )
        }
      case .user(.userSwitchedTab(.activity)):
        return .none
      case .user(.userSwitchedTab(.explore)):
        return .none
      case .local(._remoteReturnedUserDataResponse(.success(let user))):
        state.user = .loaded(user)
        state.activityFeed = .init(user: user)
        state.exploreFeed = .init()
        return .none
      case .local(._remoteReturnedUserDataResponse(.failure(let error))):
        state.user = .failure(error)
        return .none
      case .delegate:
        return .none
      case .activityFeed:
        return .none
      case .exploreFeed:
        return .none
      }
    }

    .ifLet(
      \.activityFeed,
      action: /Action.activityFeed
    ) {
      ActivityFeedReducer()
    }

    .ifLet(
      \.exploreFeed,
      action: /Action.exploreFeed
    ) {
      ExploreFeedReducer()
    }
  }
}
