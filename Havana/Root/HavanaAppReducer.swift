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
      case lifecycle
    }

    public enum Local: Equatable {
      case _userCredentialsCheckDone(Result<Bool, Never>)
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
    self.loginService = Octokit.instance.loginService
    self.userService = Octokit.instance.userService // TODO: wrap it all up in some DI container
  }

  public var body: some ReducerProtocolOf<Self> {
    Reduce<State, Action> { state, action in
      switch action {
      case .user(.lifecycle):
        return .task {
          .local(
            ._userCredentialsCheckDone(
              await loginService.isLoggedIn()
            )
          )
        }
      case .local(._userCredentialsCheckDone(.success(true))), .login(.delegate(.userLoggedInSuccessfully)):
        state = .userContext(UserContextReducer.State())
        return .none
      case .local(._userCredentialsCheckDone(.success(false))):
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
