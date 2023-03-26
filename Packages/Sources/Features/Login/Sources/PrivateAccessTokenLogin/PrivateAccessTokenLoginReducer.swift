import ComposableArchitecture
import Foundation
import Octokit

public struct PrivateAccessTokenLoginReducer: ReducerProtocol {
  public enum State: Equatable {
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

  public enum Action: Equatable {
    public enum User: Equatable {
      case userRequestedLoginUsingToken(String)
    }

    public enum Local: Equatable {
      case _remoteReturnedLoginResponse(Result<Void, Octokit.PrivateAccessTokenLoginError>)
    }

    public enum Delegate: Equatable {
      case userLoggedInSuccessfully
    }

    case user(User)
    case local(Local)
    case delegate(Delegate)
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
      case .user(.userRequestedLoginUsingToken(let token)):
        state = .loginInProgress
        return .task {
          .local(
            ._remoteReturnedLoginResponse(
              await loginService.login(using: token)
            )
          )
        }
      case .local(._remoteReturnedLoginResponse(.success)):
        state = .loginSuccessful
        return .send(.delegate(.userLoggedInSuccessfully))
      case .local(._remoteReturnedLoginResponse(.failure)):
        state = .tokenInputRetry(failureReason: .genericError)
        return .none
      case .delegate(.userLoggedInSuccessfully):
        return .none
      }
    }
  }
}

public extension PrivateAccessTokenLoginReducer.Action.Local {
  static func == (
    lhs: PrivateAccessTokenLoginReducer.Action.Local,
    rhs: PrivateAccessTokenLoginReducer.Action.Local
  ) -> Bool {
    switch (lhs, rhs) {
    case (
      ._remoteReturnedLoginResponse(.success),
      ._remoteReturnedLoginResponse(.success)
    ):
      return true
    case (
      ._remoteReturnedLoginResponse(.failure(let lhsError)),
      ._remoteReturnedLoginResponse(.failure(let rhsError))
    ):
      return lhsError == rhsError
    default:
      return false
    }
  }
}
