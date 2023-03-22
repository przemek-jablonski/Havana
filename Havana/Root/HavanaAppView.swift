import ComposableArchitecture
import LoginFeature
import SwiftUI

internal struct HavanaAppView: View {
  private let store: StoreOf<HavanaAppRoot>

  internal init(
    store: StoreOf<HavanaAppRoot> = Store(
      initialState: HavanaAppRoot.State.privateAccessTokenLogin(.tokenInputForm),
      reducer: HavanaAppRoot()._printChanges()
    )
  ) {
    self.store = store
  }

  internal var body: some View {
    SwitchStore(self.store) {
      CaseLet(
        state: /HavanaAppRoot.State.privateAccessTokenLogin,
        action: HavanaAppRoot.Action.privateAccessTokenLogin
      ) { scopedStore in
        PrivateAccessTokenLoginView(
          store: scopedStore
        )
      }
      //      CaseLet(
      //        state: /HavanaAppRoot.State.login,
      //        action: HavanaAppRoot.Action.login
      //      ) { store in
      //        NavigationView {
      //          LoginView(
      //            store: store
      //          )
      //        }
      //      }
    }
  }
}
