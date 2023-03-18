import Casimir
import Foundation
import Combine

public extension Octokit {
  struct LoginServiceMock {}
}

extension Octokit.LoginServiceMock: Octokit.ServiceMock {
  public static func happyPath() -> Octokit.LoginService {
    struct Mock: Octokit.LoginService {
      func login(using privateAccessToken: String) async -> Result<Void, Octokit.PrivateAccessTokenLoginError> {
        do {
          return try await Task {
            try await Task.sleep(nanoseconds: NSEC_PER_SEC * 3)
            return Result<Void, Octokit.PrivateAccessTokenLoginError>.success()
          }.value
        } catch {
          unimplementedFatalError()
        }
      }
    }
    return Mock()
  }
  
  public static func unhappyPath() -> Octokit.LoginService {
    struct Mock: Octokit.LoginService {
      func login(using privateAccessToken: String) async -> Result<Void, Octokit.PrivateAccessTokenLoginError> {
        do {
          return try await Task {
            try await Task.sleep(nanoseconds: NSEC_PER_SEC * 3)
            return .failure(.random)
          }.value
        } catch {
          unimplementedFatalError()
        }
      }
    }
    return Mock()
  }
  
  public static func noResponses() -> Octokit.LoginService {
    struct Mock: Octokit.LoginService {
      func login(using privateAccessToken: String) async -> Result<Void, Octokit.PrivateAccessTokenLoginError> {
        do {
          return .success(
            try await Task {
              try await Task.sleep(nanoseconds: NSEC_PER_SEC * 3)
              await Task.yield()
            }.value
          )
        } catch {
          unimplementedFatalError()
        }
      }
    }
    return Mock()
  }
}
