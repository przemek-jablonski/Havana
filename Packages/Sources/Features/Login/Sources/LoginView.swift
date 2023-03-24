import Casimir
import ComposableArchitecture
import Octokit
import SwiftUI
import SwiftUINavigation

public struct LoginView: View {
  private let store: StoreOf<Login>
  
  public init(
    store: StoreOf<Login>
  ) {
    self.store = store
  }
  
  public var body: some View {
    WithViewStore(self.store) { viewStore in
      NavigationLink(
        unwrapping: viewStore.binding(
          get: \.selectedFlow,
          send: .userSelectedLoginFlow(nil)
        ),
        case: /Login.State.LoginFlow.privateAccessTokenLoginFlow,
        destination: { _ in
          IfLetStore(
            store.scope(
              state: \.selectedFlow..Login.State.LoginFlow.privateAccessTokenLoginFlow,
              action: Login.Action.privateAccessTokenLogin
            )
          ) { scope in
            PrivateAccessTokenLoginView(
              store: scope
            )
          }
        },
        onNavigate: { _ in },
        label: {
          Button("pat") {
            viewStore.send(.userSelectedLoginFlow(.privateAccessTokenLoginFlow(.tokenInputForm)))
          }
        }
      )
    }
  }
}
