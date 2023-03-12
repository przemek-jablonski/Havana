import ComposableArchitecture
import Foundation

public struct PrivateAccessTokenLogin: ReducerProtocol {
  public enum State: Equatable {
    case tokenInput
    case loginInProgress
  }
  
  public enum Action: Equatable {
    case userDidInsertToken(String)
  }
  
  public var body: some ReducerProtocolOf<Self> {
    Reduce { state, action in
      switch action {
        default:
          return .none
      }
    }
  }
}
