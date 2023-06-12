import ComposableArchitecture
import Octokit
import SwiftUI

public struct PrivateAccessTokenLoginView: View {
  private let store: StoreOf<PrivateAccessTokenLoginReducer>

  @State private var token: String = ""

  public init(
    _ store: StoreOf<PrivateAccessTokenLoginReducer>
  ) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(store) { viewStore in
      VStack {
        TextField("Token", text: $token)
        Button("Log in") {
          // TODO: scope this to ViewState
          viewStore.send(.user(.userRequestedLoginUsingToken(token)))
        }

        if viewStore.state == .loginInProgress {
          ProgressView()
            .transition(.opacity)
        }
      }
    }
  }
}
