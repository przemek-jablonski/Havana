import ComposableArchitecture
import SwiftUI

public struct LoginView: View {
  private let store: StoreOf<LoginReducer>
  
  public init(
    store: StoreOf<LoginReducer>
  ) {
    self.store = store
  }
  
  public var body: some View {
    WithViewStore(store) { viewStore in
      
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView(
      store: Store(
        initialState: LoginReducer.State.privateAccessTokenFlow,
        reducer: LoginReducer()
      )
    )
  }
}
