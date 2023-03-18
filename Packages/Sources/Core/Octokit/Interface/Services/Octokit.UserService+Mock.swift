import Casimir
import Foundation
import Combine

public extension Octokit {
  struct UserServiceMock {}
}

extension Octokit.UserServiceMock: Octokit.ServiceMock {
  public static func happyPath() -> Octokit.UserService {
    struct Mock: Octokit.UserService {
      func user() async -> Result<Octokit.User, Octokit.NetworkServiceError> {
        do {
          return try await Task {
            try await Task.sleep(nanoseconds: NSEC_PER_SEC * 3)
            return .success(.random)
          }.value
        } catch {
          unimplementedFatalError()
        }
      }
      
      func receivedPublicEvents(
        username: String,
        page: Int
      ) async -> Result<[Octokit.UserReceivedPublicEvent], Octokit.NetworkServiceError> {
        do {
          return try await Task {
            try await Task.sleep(nanoseconds: NSEC_PER_SEC * 3)
            return .success(.random)
          }.value
        } catch {
          unimplementedFatalError()
        }
      }
    }
    
    return Mock()
  }
  
  public static func unhappyPath() -> Octokit.UserService {
    struct Mock: Octokit.UserService {
      func user() async -> Result<Octokit.User, Octokit.NetworkServiceError> {
        do {
          return try await Task {
            try await Task.sleep(nanoseconds: NSEC_PER_SEC * 3)
            return .failure(.random)
          }.value
        } catch {
          unimplementedFatalError()
        }
      }
      
      func receivedPublicEvents(
        username: String,
        page: Int
      ) async -> Result<[Octokit.UserReceivedPublicEvent], Octokit.NetworkServiceError> {
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
  
  public static func noResponses() -> Octokit.UserService {
    struct Mock: Octokit.UserService {
      func user() async -> Result<Octokit.User, Octokit.NetworkServiceError> {
        do {
          return .success(
            try await Task {
              try await Task.sleep(nanoseconds: NSEC_PER_SEC * 3)
              await Task.yield()
              return .random
            }.value
          )
        } catch {
          unimplementedFatalError()
        }
      }
      
      func receivedPublicEvents(
        username: String,
        page: Int
      ) async -> Result<[Octokit.UserReceivedPublicEvent], Octokit.NetworkServiceError> {
        do {
          return .success(
            try await Task {
              try await Task.sleep(nanoseconds: NSEC_PER_SEC * 3)
              await Task.yield()
              return .random
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
