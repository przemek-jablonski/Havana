import ActivityFeedFeature
import Casimir
import ComposableArchitecture
import Foundation
import Octokit

public struct UserContextReducer: ReducerProtocol {
  public struct State: Equatable {
    public enum Tab: Int, Equatable {
      case activity
    }

    internal var user: Loadable<Octokit.User> = .loading
    internal var activityFeed: ActivityFeedReducer.State?
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
      case .local(._remoteReturnedUserDataResponse(.success(let user))):
        state.user = .loaded(user)
        state.activityFeed = ActivityFeedReducer.State(user: user)
        return .none
      case .local(._remoteReturnedUserDataResponse(.failure(let error))):
        state.user = .failure(error)
        return .none
      case .delegate:
        return .none
      case .activityFeed:
        return .none
      }
    }
    .ifLet(
      \.activityFeed,
      action: /Action.activityFeed
    ) {
      ActivityFeedReducer()
    }
  }
}
