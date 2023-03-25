import ComposableArchitecture
import Foundation
import Octokit

public struct LoginReducer: ReducerProtocol {
  public struct State: Equatable {
    public var privateAccessTokenLogin: PrivateAccessTokenLoginReducer.State?
    public var oAuthLogin: OAuthLoginReducer.State?

    public init(
      privateAccessTokenLogin: PrivateAccessTokenLoginReducer.State? = nil,
      oAuthLogin: OAuthLoginReducer.State? = nil
    ) {
      self.privateAccessTokenLogin = privateAccessTokenLogin
      self.oAuthLogin = oAuthLogin
    }
  }

  public enum Action: Equatable {
    case privateAccessTokenLogin(PrivateAccessTokenLoginReducer.Action)
    case userRequestedPrivateAccessTokenLoginFlow
    case userDismissedPrivateAccessTokenLoginFlow

    case oAuthLogin(OAuthLoginReducer.Action)
    case userRequestedOAuthLoginFlow
    case userDismissedOAuthLoginFlow
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
      case .userRequestedPrivateAccessTokenLoginFlow:
        state.privateAccessTokenLogin = .tokenInputForm
        return .none
      case .userDismissedPrivateAccessTokenLoginFlow:
        state.privateAccessTokenLogin = nil
        return .none
      case .privateAccessTokenLogin, .oAuthLogin:
        return .none
      case .userRequestedOAuthLoginFlow:
        state.oAuthLogin = .init()
        return .none
      case .userDismissedOAuthLoginFlow:
        state.oAuthLogin = nil
        return .none
      }
    }
    .ifLet(
      \.privateAccessTokenLogin,
      action: /Action.privateAccessTokenLogin
    ) {
      PrivateAccessTokenLoginReducer(
        loginService: loginService
      )
    }
    .ifLet(
      \.oAuthLogin,
      action: /Action.oAuthLogin
    ) {
      OAuthLoginReducer()
    }
  }
}
