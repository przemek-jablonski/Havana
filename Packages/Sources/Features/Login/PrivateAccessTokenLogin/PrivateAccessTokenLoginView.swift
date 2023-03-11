import ComposableArchitecture
import SwiftUI

struct PrivateAccessTokenLoginView: View {
  private let store: StoreOf<PrivateAccessTokenLogin>
  
  internal init(store: StoreOf<PrivateAccessTokenLogin>) {
    self.store = store
  }
  
  var body: some View {
    Text("PrivateAccessTokenLogin")
  }
}

struct PrivateAccessTokenLogin_Previews: PreviewProvider {
  static var previews: some View {
    PrivateAccessTokenLoginView(
      store: Store(
        initialState: PrivateAccessTokenLogin.State.tokenInput,
        reducer: PrivateAccessTokenLogin()
      )
    )
  }
}
