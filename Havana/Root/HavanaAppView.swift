import ComposableArchitecture
import LoginFeature
import SwiftUI

internal struct HavanaAppView: View {
  private let store: StoreOf<HavanaAppReducer> = Store(
    initialState: .login(LoginReducer.State()),
    reducer: HavanaAppReducer()._printChanges()
  )

  internal init() {}

  internal var body: some View {
    NavigationView {
      // TODO: add 'observe' here
      WithViewStore(self.store) { viewStore in
        SwitchStore(self.store) {
          CaseLet(
            state: /HavanaAppReducer.State.login,
            action: HavanaAppReducer.Action.login,
            then: LoginView.init
          )
        }
        .task {
          viewStore.send(.lifecycle) // TODO: make sure that this is actually cancelled
        }
      }
    }
  }
}
