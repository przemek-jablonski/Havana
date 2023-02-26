import Combine

public extension Octokit {
  struct AuthenticationService {
    public typealias PrivateAccessToken = String
    
    // MARK: - Login
    public var login: (_ token: PrivateAccessToken) -> AnyPublisher<Void, LoginError>
    public enum LoginError: Error {
      
    }
  }
}
