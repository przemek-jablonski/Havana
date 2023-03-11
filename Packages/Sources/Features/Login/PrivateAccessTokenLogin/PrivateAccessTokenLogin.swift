import ComposableArchitecture
import Foundation

public struct PrivateAccessTokenLogin: ReducerProtocol {
  public enum State: Equatable {
    case tokenInput
  }
  
  public enum Action: Equatable {
    
  }
  
  public var body: some ReducerProtocolOf<Self> {
    Reduce { state, action in
      switch action {
      }
    }
  }
}
