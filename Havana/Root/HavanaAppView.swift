import ComposableArchitecture
import LoginFeature
import SwiftUI
import UserContextFeature

internal struct HavanaAppView: View {
  private let store: StoreOf<HavanaAppReducer> = Store(
    initialState: .loading,
    reducer: HavanaAppReducer()._printChanges()
  )

  internal init() {}

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
            ProgressView()
              .transition(.opacity)
          }
        }
        .task {
          viewStore.send(.user(.task)) // TODO: make sure that this is actually cancelled
        }
      }
    }
  }
}
