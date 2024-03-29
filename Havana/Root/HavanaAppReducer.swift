import ComposableArchitecture
import Foundation
import LoginFeature
import Octokit
import UserContextFeature

public struct HavanaAppReducer: ReducerProtocol {
  public enum State: Equatable {
    case loading
    case login(LoginReducer.State)
    case userContext(UserContextReducer.State)
  }

  public enum Action: Equatable {
    public enum User: Equatable {
      case userOpenedTheApp
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

  @Dependency(\.loginService)
  private var loginService

  @Dependency(\.userService)
  private var userService

  public var body: some ReducerProtocolOf<Self> {
    Reduce<State, Action> { state, action in
      switch action {
      case .user(.userOpenedTheApp):
        return .run { send in
          await send(
            .local(
              ._userLoginCheckResult(
                await loginService.isLoggedIn()
              )
            )
          )
        }
      case .local(._userLoginCheckResult(true)), .login(.delegate(.userLoggedInSuccessfully)):
        state = .userContext(UserContextReducer.State())
        return .none
      case .local(._userLoginCheckResult(false)):
        state = .login(LoginReducer.State())
        return .none
      case .delegate, .login, .userContext:
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
      UserContextReducer()
    }
  }
}
