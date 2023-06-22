import ComposableArchitecture
import Composables
import Foundation
import LoginFeature
import Octokit
import OctokitLive
import UserContextFeature

public struct HavanaAppReducer: ComposableReducer {
  public enum State: ComposableState {
    case loading
    case login(LoginReducer.State)
    case userContext(UserContextReducer.State)
  }

  public enum Action: ComposableAction {
    public enum User: Equatable {
      case task
    }

    public enum Local: Equatable {
      case _userLoginCheckResult(_ isLoggedIn: Bool)
    }

    public enum Delegate: Equatable {}

    case user(User)
    case local(Local)
    case delegate(Delegate)

    case login(LoginReducer.Action)
    case userContext(UserContextReducer.Action)
  }

  private var loginService: Octokit.LoginService
  private var userService: Octokit.UserService

  public init() {
    self.loginService = Octokit.v4.loginService()
    self.userService = Octokit.v4.userService() // TODO: wrap it all up in some DI container
  }

  public var body: some ReducerProtocolOf<Self> {
    Reduce<State, Action> { state, action in
      switch action {
      case .user(.task):
        return .run { send in
          await send(.local(._userLoginCheckResult(await loginService.isLoggedIn())))
        }
      case .local(._userLoginCheckResult(true)), .login(.delegate(.userLoggedInSuccessfully)):
        state = .userContext(UserContextReducer.State())
        return .none
      case .local(._userLoginCheckResult(false)):
        state = .login(LoginReducer.State())
        return .none
      case .delegate:
        return .none
      case .login:
        return .none
      case .userContext:
        return .none
      }
    }
    .ifCaseLet(
      /State.login,
      action: /Action.login
    ) {
      LoginReducer(
        loginService: loginService
      )
    }
    .ifCaseLet(
      /State.userContext,
      action: /Action.userContext
    ) {
      UserContextReducer(
        userService: userService
      )
    }
  }
}
