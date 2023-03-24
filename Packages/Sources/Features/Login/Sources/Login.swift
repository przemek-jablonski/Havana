import ComposableArchitecture
import Foundation
import Octokit

public struct Login: ReducerProtocol {
  public struct State: Equatable {
    public init(
      privateAccessTokenLogin: PrivateAccessTokenLogin.State? = nil,
      oAuthLogin: OAuthLogin.State? = nil
    ) {
      self.privateAccessTokenLogin = privateAccessTokenLogin
      self.oAuthLogin = oAuthLogin
    }

    public var privateAccessTokenLogin: PrivateAccessTokenLogin.State?
    public var oAuthLogin: OAuthLogin.State?
  }

  public enum Action: Equatable {
    case privateAccessTokenLoginSelected
    case oAuthLoginSelected
    case privateAccessTokenLogin(PrivateAccessTokenLogin.Action)
    case oAuthLogin(OAuthLogin.Action)
  }

  private let loginService: Octokit.LoginService

  public init(
    loginService: Octokit.LoginService
  ) {
    self.loginService = loginService
  }

  public var body: some ReducerProtocolOf<Self> {
    Reduce { state, action in
      switch action {
      case .privateAccessTokenLoginSelected:
        state.privateAccessTokenLogin = .tokenInputForm
        state.oAuthLogin = nil
        return .none
      case .oAuthLoginSelected:
        state.privateAccessTokenLogin = nil
        state.oAuthLogin = .init()
        return .none
      default:
        return .none
      }
    }
    .ifLet(
      \.privateAccessTokenLogin,
      action: /Action.privateAccessTokenLogin
    ) {
      PrivateAccessTokenLogin(
        loginService: loginService
      )
    }
    .ifLet(
      \.oAuthLogin,
      action: /Action.oAuthLogin
    ) {
      OAuthLogin()
    }
  }
}
