//import Casimir
//import Foundation
//import Combine
//
//public extension Octokit.UserService {
//  enum Mock {}
//}
//
//public extension Octokit.UserService.Mock {
//  static var happyPath: Octokit.UserService {
//    Octokit.UserService(
//      user: {
//        Just(.random).setFailureType(to: NetworkServiceError.self)
//      },
//      receivedPublicEvents: { _, _ in
//        Just(.random).setFailureType(to: NetworkServiceError.self)
//      }
//    )
//  }
//  
//  static var randomError: Octokit.UserService {
//    Octokit.UserService(
//      user: {
//        Fail(error: NetworkServiceError.networkRequestFailed(EmptyError()))
//      },
//      receivedPublicEvents: { _, _ in
//        Fail(error: NetworkServiceError.networkRequestFailed(EmptyError()))
//      }
//    )
//  }
//}
