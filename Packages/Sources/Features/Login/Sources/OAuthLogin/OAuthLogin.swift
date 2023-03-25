import ComposableArchitecture
import SwiftUI

public struct OAuthLoginReducer: ReducerProtocol {
  public struct State: Equatable {}
  public enum Action: Equatable {
    case onAppear
  }

  public var body: some ReducerProtocolOf<Self> {
    Reduce { _, action in
      switch action {
      default:
        return .none
      }
    }
  }
}

public struct OAuthLoginView: View {
  private let store: StoreOf<OAuthLoginReducer>

  public init(_ store: StoreOf<OAuthLoginReducer>) {
    self.store = store
  }

  public var body: some View {
    Text("OAuth")
  }
}
