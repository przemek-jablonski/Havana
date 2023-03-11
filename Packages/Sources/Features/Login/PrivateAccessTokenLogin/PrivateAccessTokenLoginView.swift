import ComposableArchitecture
import SwiftUI

struct PrivateAccessTokenLoginView: View {
  private let store: StoreOf<PrivateAccessTokenLoginReducer>
  
  internal init(store: StoreOf<PrivateAccessTokenLoginReducer>) {
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
        initialState: PrivateAccessTokenLoginReducer.State(),
        reducer: PrivateAccessTokenLoginReducer()
      )
    )
  }
}
