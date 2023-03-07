import ComposableArchitecture
import Foundation

public struct LoginReducer: ReducerProtocol {
  public enum State: Equatable {
    /**
     Initial state of the screen - presenting greeting to the user. Here user can select which login flow to use.
     */
    case greeting
    /**
     Displaying editable fields where user can input PAT (Private Access Token)
     */
    case privateAccessTokenFlowSelected
    /**
     
     */
    case oauthFlowSelected
  }
  
  public enum Action {
    case userDidTapLoginWithPrivateAccessTokenButton(token: String)
    case userDidTapLoginWithGithubButton(token: String)
  }
  
  public var body: some ReducerProtocol<State, Action> {
    Reduce { state, action in
      switch action {
        case .userDidTapLoginButton(let token):
          return .none
      }
    }
  }
}
