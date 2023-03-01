import Combine
import Foundation

public protocol LoginService {
  func login(
    using privateAccessToken: String
  ) -> AnyPublisher<Void, PrivateAccessTokenLoginError>
}

public enum PrivateAccessTokenLoginError: Error {
  case unableToStorePrivateAccessToken(_ error: Error)
}
