import ComposableArchitecture
import Composables
import Foundation
import LoginFeature
import Octokit
import OctokitLive

public struct HavanaAppReducer: ComposableReducer {
  public enum State: ComposableState {
    case login(LoginReducer.State)
    case content
  }

  public enum Action: ComposableAction {
    public enum User: Equatable {
      case lifecycle
    }

    public enum Local: Equatable {
      case _userCredentialsFound
      case _userCredentialsNotFound
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
          await loginService
            .isLoggedIn()
            .map { isLoggedIn in
              isLoggedIn ? Action.Local._userCredentialsFound : Action.Local._userCredentialsNotFound
            }
        }
      case .local(._userCredentialsFound):
        state = .content
        return .none
      case .local(._userCredentialsNotFound):
        state = .login(.init())
        return .none
      case .delegate:
        return .none
      }
      //      switch action {
      //      case .lifecycle:
      //        return .task {
      //          await loginService.isLoggedIn()
      //        }
      //      case .login(.delegate(.userLoggedInSuccessfully)):
      //        state = .content
      //        return .none
      //      }
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
