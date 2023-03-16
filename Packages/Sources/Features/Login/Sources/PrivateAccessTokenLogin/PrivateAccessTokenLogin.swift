import ComposableArchitecture
import Foundation
import Octokit

public extension PrivateAccessTokenLogin {
  enum State: Equatable {
    /**
     User is presented with form where inputting the Private Access Token is possible
     */
    case tokenInput
    /**
     Login service is performing the logging-in process.
     */
    case loginInProgress
    
    /**
     Logging in failed. User is presented with opportunity to input the token again and the
     */
    case tokenInputRetry(failedToken: String, failureReason: TokenInputRetryReason)
    public enum TokenInputRetryReason {
      case genericError
    }
  }
  
  enum Action: Equatable {
    case userDidRequestLoginUsingToken(token: String)
  }
}

public struct PrivateAccessTokenLogin: ReducerProtocol {
  
  private let loginService: Octokit.LoginService
  
  public init(
    loginService: Octokit.LoginService
  ) {
    self.loginService = loginService
  }
  
  public var body: some ReducerProtocolOf<Self> {
    Reduce { state, action in
      switch action {
        case .userDidRequestLoginUsingToken(let token):
          state = .loginInProgress
          return .none
      }
    }
  }
}
