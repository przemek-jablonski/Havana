import ComposableArchitecture
import LoginFeature
import Octokit
import OctokitLive

public struct Havana: ReducerProtocol {
  public enum State: Equatable {
    case login(Login.State)
  }

  public enum Action: Equatable {
    case login(Login.Action)
  }

  private var loginService: Octokit.LoginService

  public init() {
    self.loginService = Octokit.instance.loginService
  }

  public var body: some ReducerProtocolOf<Self> {
    Reduce { _, action in
      switch action {
      case .login:
        return .none
      }
    }
    .ifCaseLet(/Havana.State.login, action: /Havana.Action.login) {
      Login(
        loginService: loginService
      )
    }
  }
}
