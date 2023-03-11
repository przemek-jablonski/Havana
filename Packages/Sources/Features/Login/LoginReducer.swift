import ComposableArchitecture
import Foundation

public struct LoginReducer: ReducerProtocol {
  public enum State: Equatable {
    /**
     Initial state of the screen - presenting greeting to the user. Here user can select which login flow to use (private access token login or oauth).
     */
    case initial
    
    /**
     Displaying editable fields where user can input Private Access Token.
     */
    case privateAccessTokenLoginFlow(PrivateAccessTokenLoginReducer.State)
    
    /**
      Displaying webview with the oAuth2 login.
     */
    case oauthLoginFlow
  }
  
  public enum Action {
    case userDidTapLoginWithPrivateAccessTokenButton
    case userDidTapLoginWithGithubButton
  }
  
  public var body: some ReducerProtocolOf<Self> {
    Reduce { state, action in
      switch action {
        case .userDidTapLoginWithGithubButton:
          state = .oauthLoginFlow
          return .none
        case .userDidTapLoginWithPrivateAccessTokenButton:
          state = .privateAccessTokenLoginFlow
          return .none
      }
    }
  }
}
