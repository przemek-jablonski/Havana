import Casimir
import Foundation

public extension Octokit {
  struct LoginServiceMock {}
}

extension Octokit.LoginServiceMock: Octokit.ServiceMock {
  public static func happyPath() -> Octokit.LoginService {
    struct Mock: Octokit.LoginService {
      func login(using privateAccessToken: String) async -> Result<Void, Octokit.PrivateAccessTokenLoginError> {
        do {
          return try await Task {
            try await Task.sleep(nanoseconds: mockedResponseDelayNanoseconds)
            return .success()
          }.value
        } catch {
          unimplementedFatalError()
        }
      }
      func isLoggedIn() async -> Result<Bool, Never> {
        do {
          return try await Task {
            try await Task.sleep(nanoseconds: mockedResponseDelayNanoseconds)
            return .success(true)
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
            try await Task.sleep(nanoseconds: mockedResponseDelayNanoseconds)
            return .failure(.random())
          }.value
        } catch {
          unimplementedFatalError()
        }
      }

      func isLoggedIn() async -> Result<Bool, Never> {
        do {
          return try await Task {
            try await Task.sleep(nanoseconds: mockedResponseDelayNanoseconds)
            return .success(false)
          }.value
        } catch {
          unimplementedFatalError()
        }
      }
    }
    return Mock()
  }

  // TODO: this won't work
  public static func noResponses() -> Octokit.LoginService {
    struct Mock: Octokit.LoginService {
      func login(using privateAccessToken: String) async -> Result<Void, Octokit.PrivateAccessTokenLoginError> {
        do {
          return .success(
            try await Task {
              try await Task.sleep(nanoseconds: mockedResponseDelayNanoseconds)
              await Task.yield()
            }.value
          )
        } catch {
          unimplementedFatalError()
        }
      }

      func isLoggedIn() async -> Result<Bool, Never> {
        do {
          return try await Task {
            try await Task.sleep(nanoseconds: mockedResponseDelayNanoseconds)
            return .success(false)
          }.value
        } catch {
          unimplementedFatalError()
        }
      }
    }
    return Mock()
  }
}
