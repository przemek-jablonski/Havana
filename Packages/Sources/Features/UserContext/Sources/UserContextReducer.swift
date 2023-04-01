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

    internal var user: LoadableData<Octokit.User>?
    internal var activityFeed: ActivityFeedReducer.State?
    internal var selectedTab: Tab

    public init(
      user: LoadableData<Octokit.User>? = nil,
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

    public enum Local: Equatable {
      case _remoteReturnedUserDataResponse(Result<Octokit.User, Octokit.NetworkServiceError>)
    }

    public enum Delegate: Equatable {}

    case user(User)
    case local(Local)
    case delegate(Delegate)

    case activityFeed(ActivityFeedReducer.Action)
  }

  private let userService: Octokit.UserService

  public init(
    userService: Octokit.UserService
  ) {
    self.userService = userService
  }

  public var body: some ReducerProtocolOf<Self> {
    Reduce<State, Action> { state, action in
      switch action {
        case .user(.lifecycle):
          state.user = .loading
          return .task {
            .local(
              ._remoteReturnedUserDataResponse(
                await userService.user()
              )
            )
          }
        case .user(.switchedTab(.activity)):
          return .none
        case .local(._remoteReturnedUserDataResponse(.success(let user))):
          state.user = .loaded(user)
          state.activityFeed = ActivityFeedReducer.State(
            user: user,
            publicEvents: .loading
          )
          return .none
        case .local(._remoteReturnedUserDataResponse(.failure(let error))):
          // TODO: error mapping
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
      ActivityFeedReducer(
        userService: Octokit.UserServiceMock.happyPath()
      )
    }
  }
}
