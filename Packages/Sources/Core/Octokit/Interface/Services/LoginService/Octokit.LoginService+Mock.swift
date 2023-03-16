//import Casimir
//import Foundation
//import Combine
//
//public extension Octokit.LoginService {
//  enum Mock {}
//}
//
//public extension Octokit.LoginService.Mock {
//  static var loginSuccessful: Octokit.LoginService {
//    Octokit.LoginService(
//      login: { _ in
//        Just(())
//          .delay(for: 3, scheduler: DispatchQueue.global())
//          .setFailureType(to: Octokit.PrivateAccessTokenLoginError.self)
//      }
//    )
//  }
//  
//  static var loginFailed: Octokit.LoginService {
//    Octokit.LoginService(
//      login: { _ in
//        Fail(error: PrivateAccessTokenLoginError.unableToStorePrivateAccessToken(EmptyError()))
//      }
//    )
//  }
//  
//  static var loginNoResponse: Octokit.LoginService {
//    Octokit.LoginService(
//      login: { _ in
//        Empty(
//          outputType: Void.self,
//          failureType: PrivateAccessTokenLoginError.self
//        )
//      }
//    )
//  }
//}
