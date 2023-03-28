import ComposableArchitecture
import Composables
import Foundation
import LoginFeature
import Octokit
import OctokitLive

public struct HavanaAppReducer: ComposableReducer {
  public enum State: ComposableState {
    case login(LoginReducer.State)
    case userContext
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
  }

  private var loginService: Octokit.LoginService

  public init() {
    self.loginService = Octokit.instance.loginService
  }

  public var body: some ReducerProtocolOf<Self> {
    Reduce<State, Action> { state, action in
      switch action {
      case .user(.lifecycle):
        return .task {
          .local(._userCredentialsCheckDone(await loginService.isLoggedIn()))
        }
      case .local(._userCredentialsCheckDone(.success(true))), .login(.delegate(.userLoggedInSuccessfully)):
        state = .userContext
        return .none
      case .local(._userCredentialsCheckDone(.success(false))):
        state = .login(.init())
        return .none
      case .delegate:
        return .none
      case .login:
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
  }
}
