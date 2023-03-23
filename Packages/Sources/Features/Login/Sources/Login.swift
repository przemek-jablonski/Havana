import ComposableArchitecture
import Foundation
import Octokit

public struct Login: ReducerProtocol {
  public enum State: Equatable {
    case privateAccessTokenLogin(PrivateAccessTokenLogin.State)
    //    /**
    //     Presenting greeting to the user. Here user can select which login flow to use (private access token login or oauth).
    //     */
    //    case loginFlowSelection(LoginFlowSelection.State)
    //
    //    /**
    //     Displaying editable fields where user can input Private Access Token.
    //     */
    //    case privateAccessTokenLoginFlow(PrivateAccessTokenLogin.State)
    //
    //    /**
    //     Displaying webview with the oAuth2 login.
    //     */
    //    case oauthLoginFlow
    //
    //    /**
    //     User is logged in.
    //     */
    //    case loggedIn
  }

  public enum Action: Equatable {
    case privateAccessTokenLogin(PrivateAccessTokenLogin.Action)
    //    case loginFlowSelectionAction(LoginFlowSelection.Action)
    //    case privateAccessTokenLoginFlowAction(PrivateAccessTokenLogin.Action)
  }

  private let loginService: Octokit.LoginService

  public init(
    loginService: Octokit.LoginService
  ) {
    self.loginService = loginService
  }

  public var body: some ReducerProtocolOf<Self> {
    Scope(
      state: /State.privateAccessTokenLogin,
      action: /Action.privateAccessTokenLogin
    ) {
      PrivateAccessTokenLogin(
        loginService: loginService
      )
    }
    //    Reduce { state, action in
    //      switch action {
    //      case .loginFlowSelectionAction(.userSelectedPrivateAccessTokenFlow):
    //        state = .privateAccessTokenLoginFlow(.tokenInputForm)
    //        return .none
    //      case .loginFlowSelectionAction(.userSelectedOAuthFlow):
    //        state = .oauthLoginFlow
    //        return .none
    //      case .privateAccessTokenLoginFlowAction:
    //        return .none
    //      }
    //    }
    //    Scope(
    //      state: /Login.State.privateAccessTokenLoginFlow,
    //      action: /Login.Action.privateAccessTokenLoginFlowAction) {
    //      PrivateAccessTokenLogin(
    //        loginService: loginService
    //      )
    //    }
  }
}
