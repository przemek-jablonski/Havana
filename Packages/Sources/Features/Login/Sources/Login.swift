import ComposableArchitecture
import Foundation
import Octokit

public struct Login: ReducerProtocol {
  public enum State: Equatable {
    /**
     Presenting greeting to the user. Here user can select which login flow to use (private access token login or oauth).
     */
    case loginFlowSelection
    
    /**
     Displaying editable fields where user can input Private Access Token.
     */
    case privateAccessTokenLoginFlow(PrivateAccessTokenLogin.State)
    
    /**
     Displaying webview with the oAuth2 login.
     */
    case oauthLoginFlow
  }
  
  public enum Action: Equatable {
    case userDidTapLoginWithPrivateAccessTokenButton(PrivateAccessTokenLogin.Action)
    case userDidTapLoginWithGithubButton
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
        case .userDidTapLoginWithGithubButton:
          state = .oauthLoginFlow
          return .none
        case .userDidTapLoginWithPrivateAccessTokenButton:
          state = .privateAccessTokenLoginFlow(.tokenInput)
          return .none
      }
    }
    .ifCaseLet(
      /State.privateAccessTokenLoginFlow,
       action: /Action.userDidTapLoginWithPrivateAccessTokenButton
    ) {
      PrivateAccessTokenLogin(loginService: loginService)
    }
  }
}
