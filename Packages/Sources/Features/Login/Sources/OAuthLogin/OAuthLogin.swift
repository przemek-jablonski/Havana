import ComposableArchitecture
import SwiftUI

public struct OAuthLogin: ReducerProtocol {
  public struct State: Equatable {}
  public enum Action: Equatable {
    case initial
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
  private let store: StoreOf<OAuthLogin>

  public init(store: StoreOf<OAuthLogin>) {
    self.store = store
  }

  public var body: some View {
    Text("OAuth")
  }
}
