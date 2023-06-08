import Casimir
import Foundation

public extension Octokit {
  struct UserServiceMock {}
}

extension Octokit.UserServiceMock: Octokit.ServiceMock {
  public static func happyPath() -> Octokit.UserService {
    struct Mock: Octokit.UserService {
      func user() async -> Result<Octokit.User, Octokit.NetworkServiceError> {
        do {
          return try await Task {
            try await Task.sleep(nanoseconds: mockedResponseDelayNanoseconds)
            return .success(.random())
          }.value
        } catch {
          unimplementedFatalError()
        }
      }

      func events(
        username: String,
        page: Int
      ) async -> Result<[Octokit.Event], Octokit.NetworkServiceError> {
        do {
          return try await Task {
            try await Task.sleep(nanoseconds: mockedResponseDelayNanoseconds)
            return .success(.random())
          }.value
        } catch {
          unimplementedFatalError()
        }
      }

      func receivedEvents(
        username: String,
        page: Int
      ) async -> Result<[Octokit.Event], Octokit.NetworkServiceError> {
        await events(
          username: username,
          page: page
        )
      }
    }

    return Mock()
  }

  public static func unhappyPath() -> Octokit.UserService {
    struct Mock: Octokit.UserService {
      func user() async -> Result<Octokit.User, Octokit.NetworkServiceError> {
        do {
          return try await Task {
            try await Task.sleep(nanoseconds: mockedResponseDelayNanoseconds)
            return .failure(.random())
          }.value
        } catch {
          unimplementedFatalError()
        }
      }

      func events(
        username: String,
        page: Int
      ) async -> Result<[Octokit.Event], Octokit.NetworkServiceError> {
        do {
          return try await Task {
            try await Task.sleep(nanoseconds: mockedResponseDelayNanoseconds)
            return .failure(.random())
          }.value
        } catch {
          unimplementedFatalError()
        }
      }

      func receivedEvents(
        username: String,
        page: Int
      ) async -> Result<[Octokit.Event], Octokit.NetworkServiceError> {
        await events(
          username: username,
          page: page
        )
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
              try await Task.sleep(nanoseconds: mockedResponseDelayNanoseconds)
              await Task.yield()
              return .random()
            }.value
          )
        } catch {
          unimplementedFatalError()
        }
      }

      func events(
        username: String,
        page: Int
      ) async -> Result<[Octokit.Event], Octokit.NetworkServiceError> {
        do {
          return .success(
            try await Task {
              try await Task.sleep(nanoseconds: mockedResponseDelayNanoseconds)
              await Task.yield()
              return .random()
            }.value
          )
        } catch {
          unimplementedFatalError()
        }
      }

      func receivedEvents(
        username: String,
        page: Int
      ) async -> Result<[Octokit.Event], Octokit.NetworkServiceError> {
        await events(
          username: username,
          page: page
        )
      }
    }

    return Mock()
  }
}
