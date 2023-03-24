import ComposableArchitecture
import Foundation
import Octokit

public struct Login: ReducerProtocol {
  public struct State: Equatable {

    public enum LoginFlow: Equatable {
      case privateAccessTokenLoginFlow(PrivateAccessTokenLogin.State)
      case oAuthLoginFlow
    }

    public var selectedFlow: LoginFlow?

    public init(selectedFlow: LoginFlow? = nil) {
      self.selectedFlow = selectedFlow
    }
  }

  public enum Action: Equatable {
    case privateAccessTokenLogin(PrivateAccessTokenLogin.Action)
    case oAuthLogin(OAuthLogin.Action)

    case userSelectedLoginFlow(State.LoginFlow?)
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
      case .oAuthLogin, .privateAccessTokenLogin:
        return .none
      case .userSelectedLoginFlow(let selectedFlow):
        state.selectedFlow = selectedFlow
        return .none
      }
    }
    //    Reduce { state, action in
    //      switch action {
    //      case .privateAccessTokenLoginSelected:
    //        state.privateAccessTokenLogin = .tokenInputForm
    //        state.oAuthLogin = nil
    //        return .none
    //      case .oAuthLoginSelected:
    //        state.privateAccessTokenLogin = nil
    //        state.oAuthLogin = .init()
    //        return .none
    //      default:
    //        return .none
    //      }
    //    }
    //    .ifLet(
    //      \.privateAccessTokenLogin,
    //      action: /Action.privateAccessTokenLogin
    //    ) {
    //      PrivateAccessTokenLogin(
    //        loginService: loginService
    //      )
    //    }
    //    .ifLet(
    //      \.oAuthLogin,
    //      action: /Action.oAuthLogin
    //    ) {
    //      OAuthLogin()
    //    }
  }
}
