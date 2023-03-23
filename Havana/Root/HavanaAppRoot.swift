import ComposableArchitecture
import LoginFeature
import Octokit
import OctokitLive

public struct HavanaAppRoot: ReducerProtocol {
  public enum State: Equatable {
    case privateAccessTokenLogin(PrivateAccessTokenLogin.State)
    case content
  }

  public enum Action: Equatable {
    case privateAccessTokenLogin(PrivateAccessTokenLogin.Action)
    //    case login(Login.Action)
  }

  private var loginService: Octokit.LoginService

  public init() {
    self.loginService = Octokit.instance.loginService
  }

  public var body: some ReducerProtocolOf<Self> {
    //    Scope(
    //      state: /State.login,
    //      action: /Action.login
    //    ) {
    //      Login(
    //        loginService: loginService
    //      )
    //    }
    Reduce { state, action in
      switch action {
      case .privateAccessTokenLogin(.remoteReturnedLoginResponse(response: .success)):
        state = .content
        return .none
      default:
        return .none
      }
    }

    Scope(
      //      state: /State.privateAccessTokenLogin(.tokenInputForm), this is valid as well 🤔
      state: /State.privateAccessTokenLogin,
      action: /Action.privateAccessTokenLogin
    ) {
      PrivateAccessTokenLogin(
        loginService: loginService
      )
    }
  }
}
