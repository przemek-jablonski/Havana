import ComposableArchitecture
import Foundation
import Octokit

// TODO: shouldn't this be internal?
public struct PrivateAccessTokenLoginReducer: ReducerProtocol {
  public enum State: Equatable {
    /**
     User is presented with form where inputting the Private Access Token is possible
     */
    case tokenInputForm
    /**
     Login service is actively performing the logging-in process.
     */
    case loginInProgress

    /**
     Logging in has failed. User is presented with opportunity to input the token again and the
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
      case _receivedLoginResult(TaskResult<None>)
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
        return .run { send in
          await send(
            .local(
              ._receivedLoginResult(
                TaskResult {
                  try await loginService.login(token)
                }
              )
            )
          )
        }
      case .local(._receivedLoginResult(.success)):
        state = .loginSuccessful
        return .send(.delegate(.userLoggedInSuccessfully))
      case .local(._receivedLoginResult(.failure)):
        state = .tokenInputRetry(failureReason: .genericError)
        return .none
      case .delegate(.userLoggedInSuccessfully):
        return .none
      }
    }
  }
}
