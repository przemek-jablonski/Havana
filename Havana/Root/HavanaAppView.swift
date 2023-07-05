import ComposableArchitecture
import LoginFeature
import SwiftUI
import UserContextFeature

internal struct HavanaAppView: View {
  private let store = Store(initialState: .loading) {
    HavanaAppReducer()
      ._printChanges()
  }

  internal var body: some View {
    NavigationView {
      WithViewStore(store) { viewStore in
        SwitchStore(self.store) {
          CaseLet(
            state: /HavanaAppReducer.State.login,
            action: HavanaAppReducer.Action.login
          ) { store in
            LoginView(store)
              .transition(.opacity)
          }

          CaseLet(
            state: /HavanaAppReducer.State.userContext,
            action: HavanaAppReducer.Action.userContext
          ) { store in
            UserContextView(store)
              .transition(.opacity)
          }

          Default {
            // TODO: should be an error
            ProgressView()
              .transition(.opacity)
          }
        }
        .task {
          viewStore.send(.user(.userOpenedTheApp))
        }
      }
    }
  }
}
