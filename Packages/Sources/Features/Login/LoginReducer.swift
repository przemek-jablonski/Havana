import ComposableArchitecture
import Foundation

public struct LoginReducer: ReducerProtocol {
  public enum State: String, Equatable {
    /**
     Initial state of the screen - presenting greeting to the user. Here user can select which login flow to use.
     */
    case greeting
    
    /**
     Displaying editable fields where user can input Private Access Token.
     */
    case privateAccessTokenLoginFlow
    
    /**
      Displaying webview with the oAuth2 login.
     */
    case oauthLoginFlow
  }
  
  public enum Action {
    case userDidTapLoginWithPrivateAccessTokenButton
    case userDidTapLoginWithGithubButton
  }
  
  public var body: some ReducerProtocol<State, Action> {
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
