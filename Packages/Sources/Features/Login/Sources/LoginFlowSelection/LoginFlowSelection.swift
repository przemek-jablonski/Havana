// import ComposableArchitecture
//
// public struct LoginFlowSelection: ReducerProtocol {
//  public struct State: Equatable {
//    public enum Selection: Equatable {
//      case flowSelection
//      case privateAccessTokenFlowSelected(PrivateAccessTokenLogin.State)
//    }
//    var selection: Selection
//  }
//
//  public enum Action: Equatable {
//    case privateAccessTokenFlow(PrivateAccessTokenLogin.Action)
//    case userSelectedOAuthFlow
//  }
//
//  internal init() {}
//
//  public var body: some ReducerProtocolOf<Self> {
//    Scope(
//      state: \.selection,
//      action: /Action.userSelectedOAuthFlow
//    ) {
//        <#code#>
//      }
//  }
// }
