// import ComposableArchitecture
// import Foundation
// import Octokit
//
// public struct LoginFlowSelection: ReducerProtocol {
//  public enum State: Equatable {
//      case privateAccessTokenFlowSelected(PrivateAccessTokenLogin.State)
//  }
//
//  public enum Action: Equatable {
//    case privateAccessTokenFlow(PrivateAccessTokenLogin.Action)
//    case oauthFlow
//  }
//
//  private let loginService: Octokit.LoginService
//
//  internal init(
//    loginService: Octokit.LoginService
//  ) {
//    self.loginService = loginService
//  }
//
//  public var body: some ReducerProtocolOf<Self> {
//    Reduce { state, action in
//      switch action {
//        default:
//          return .none
//      }
//    }
//  }
// }
