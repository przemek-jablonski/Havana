// import Casimir
// import Foundation
//
// public extension Octokit {
//  struct RootServiceMock {}
// }
//
// extension Octokit.RootServiceMock: Octokit.ServiceMock {
//  public static func happyPath() -> Octokit.RootService {
//    struct Mock: Octokit.RootService {
//      func get(
//        privateAccessToken: String?
//      ) async -> Result<Octokit.Hyperlinks, Octokit.NetworkServiceError> {
//        do {
//          return try await Task {
//            try await Task.sleep(nanoseconds: mockedResponseDelayNanoseconds)
//            return Result<Octokit.Hyperlinks, Octokit.NetworkServiceError>.success(.random)
//          }.value
//        } catch {
//          unimplementedFatalError()
//        }
//      }
//
//      func validate(
//        privateAccessToken: String
//      ) async -> Result<Bool, Never> {
//        do {
//          return try await Task {
//            try await Task.sleep(nanoseconds: mockedResponseDelayNanoseconds)
//            return Result<Bool, Never>.success(true)
//          }.value
//        } catch {
//          unimplementedFatalError()
//        }
//      }
//    }
//    return Mock()
//  }
//
//  public static func unhappyPath() -> Octokit.RootService {
//    struct Mock: Octokit.RootService {
//      func get(
//        privateAccessToken: String?
//      ) async -> Result<Octokit.Hyperlinks, Octokit.NetworkServiceError> {
//        do {
//          return try await Task {
//            try await Task.sleep(nanoseconds: mockedResponseDelayNanoseconds)
//            return Result<Octokit.Hyperlinks, Octokit.NetworkServiceError>.failure(.random)
//          }.value
//        } catch {
//          unimplementedFatalError()
//        }
//      }
//
//      func validate(
//        privateAccessToken: String
//      ) async -> Result<Bool, Never> {
//        do {
//          return try await Task {
//            try await Task.sleep(nanoseconds: mockedResponseDelayNanoseconds)
//            return Result<Bool, Never>.success(false)
//          }.value
//        } catch {
//          unimplementedFatalError()
//        }
//      }
//    }
//    return Mock()
//  }
//
//  // TODO: this won't work
//  public static func noResponses() -> Octokit.RootService {
//    struct Mock: Octokit.RootService {
//      func get(
//        privateAccessToken: String?
//      ) async -> Result<Octokit.Hyperlinks, Octokit.NetworkServiceError> {
//        do {
//          return try await Task {
//            try await Task.sleep(nanoseconds: mockedResponseDelayNanoseconds)
//            return Result<Octokit.Hyperlinks, Octokit.NetworkServiceError>.failure(.random)
//          }.value
//        } catch {
//          unimplementedFatalError()
//        }
//      }
//
//      func validate(
//        privateAccessToken: String
//      ) async -> Result<Bool, Never> {
//        do {
//          return try await Task {
//            try await Task.sleep(nanoseconds: mockedResponseDelayNanoseconds)
//            return Result<Bool, Never>.success(false)
//          }.value
//        } catch {
//          unimplementedFatalError()
//        }
//      }
//    }
//    return Mock()
//  }
// }
