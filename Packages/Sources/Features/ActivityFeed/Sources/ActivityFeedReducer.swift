import Casimir
import ComposableArchitecture
import Composables
import Foundation
import Octokit
// import OctokitLive // TODO: importing implementations in features should not be possible

public struct ActivityFeedReducer: ComposableReducer {
  public struct State: ComposableState {
    internal let user: Octokit.User
    internal var publicEvents: LoadableData<IdentifiedArrayOf<Octokit.UserReceivedPublicEvent>>

    public init(
      user: Octokit.User,
      publicEvents: LoadableData<IdentifiedArrayOf<Octokit.UserReceivedPublicEvent>>
    ) {
      self.user = user
      self.publicEvents = publicEvents
    }
  }

  public enum Action: ComposableAction {
    public enum User: Equatable {
      case lifecycle
    }

    public enum Local: Equatable {}

    public enum Delegate: Equatable {}

    case user(User)
    case local(Local)
    case delegate(Delegate)
  }

  private let userService: Octokit.UserService

  public init(
    userService: Octokit.UserService
  ) {
    self.userService = userService
  }

  public var body: some ReducerProtocolOf<Self> {
    Reduce<State, Action> { _, action in
      switch action {
      case .user(.lifecycle):
        return .none
      //          return .task {
      ////            state.user.name
      ////            await userService.receivedPublicEvents(username: <#T##String#>, page: <#T##Int#>)
      //          }
      case .user, .local, .delegate:
        return .none
      }
    }
  }
}
