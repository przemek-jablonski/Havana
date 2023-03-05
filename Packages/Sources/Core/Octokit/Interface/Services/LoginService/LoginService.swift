import Combine
import Foundation

public extension Octokit {
  struct LoginService {
    public typealias PrivateAccessToken = String
    public var login: (_ token: PrivateAccessToken) -> any Publisher<Void, PrivateAccessTokenLoginError>
  }
}

public enum PrivateAccessTokenLoginError: Error {
  case unableToStorePrivateAccessToken(_ error: Error)
}
