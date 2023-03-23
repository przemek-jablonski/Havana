import ComposableArchitecture
import Foundation
import Octokit

public extension PrivateAccessTokenLogin {
  enum State: Equatable {
    /**
     User is presented with form where inputting the Private Access Token is possible
     */
    case tokenInputForm
    /**
     Login service is performing the logging-in process.
     */
    case loginInProgress

    /**
     Logging in failed. User is presented with opportunity to input the token again and the
     */
    case tokenInputRetry(failureReason: TokenInputRetryReason)
    public enum TokenInputRetryReason {
      case genericError
    }

    /**
     Login was successful, user is authenticated.
     */
    case loginSuccessful
  }

  enum Action: Equatable {
    case userRequestedLoginUsingToken(token: String)
    case remoteReturnedLoginResponse(response: Result<Void, Octokit.PrivateAccessTokenLoginError>)
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
      case .userRequestedLoginUsingToken(let token):
        state = .loginInProgress
        return .task {
          .remoteReturnedLoginResponse(
            response: await loginService.login(using: token)
          )
        }
      case .remoteReturnedLoginResponse(response: .success):
        state = .loginSuccessful
        return .none
      case .remoteReturnedLoginResponse(response: .failure):
        state = .tokenInputRetry(failureReason: .genericError)
        return .none
      }
    }
  }
}

public extension PrivateAccessTokenLogin.Action {
  static func == (
    lhs: PrivateAccessTokenLogin.Action,
    rhs: PrivateAccessTokenLogin.Action
  ) -> Bool {
    switch (lhs, rhs) {
    case (
      .userRequestedLoginUsingToken(let lhsToken),
      .userRequestedLoginUsingToken(let rhsToken)
    ):
      return lhsToken == rhsToken
    case (
      .remoteReturnedLoginResponse(.success()),
      .remoteReturnedLoginResponse(.success)
    ):
      return true
    case (
      .remoteReturnedLoginResponse(.failure(let lhsError)),
      .remoteReturnedLoginResponse(.failure(let rhsError))
    ):
      return lhsError == rhsError
    default:
      return false
    }
  }
}
