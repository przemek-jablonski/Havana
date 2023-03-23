import Casimir
import ComposableArchitecture
import Octokit
import SwiftUI

public struct LoginView: View {
  private let store: StoreOf<Login>

  public init(
    store: StoreOf<Login>
  ) {
    self.store = store
  }

  public var body: some View {
    SwitchStore(self.store) {
      CaseLet(
        state: /Login.State.privateAccessTokenLogin,
        action: Login.Action.privateAccessTokenLogin
      ) { scopedStore in
        PrivateAccessTokenLoginView(
          store: scopedStore
        )
      }
    }
  }
}

// internal struct LoginView_Previews: PreviewProvider {
//  internal static var previews: some View {
//    LoginView(
//      store: Store(
//        initialState: Login.State.loginFlowSelection(.selectionFormPresented),
//        reducer: Login(
//          loginService: Octokit.LoginServiceMock.happyPath()
//        )
//      )
//    )
//  }
// }
