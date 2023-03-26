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
      SwitchStore(self.store) {
        CaseLet(
          state: /HavanaAppReducer.State.login,
          action: HavanaAppReducer.Action.login,
          then: LoginView.init
        )
      }
    }
  }
}
