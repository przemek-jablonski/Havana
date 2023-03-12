import ComposableArchitecture
import SwiftUI

struct PrivateAccessTokenLoginView: View {
  private let store: StoreOf<PrivateAccessTokenLogin>
  
  struct ViewState: Equatable {
    @BindingState var token: String
    
    static func extractViewState(from reducerState: PrivateAccessTokenLogin.State) -> Self {
      ViewState(token: "")
    }
  }
  
  enum ViewAction: Equatable, BindableAction {
    case action1
    case action2
    case binding(BindingAction<ViewState>)
    
    static func convertToReducerAction(using viewAction: Self) -> PrivateAccessTokenLogin.Action {
      .userDidInsertToken("asf")
    }
  }
  
  internal init(store: StoreOf<PrivateAccessTokenLogin>) {
    self.store = store
  }
  
  var body: some View {
    WithViewStore(
      store,
      observe: ViewState.extractViewState(from:),
      send: ViewAction.convertToReducerAction(using:)
    ) { viewStore in
      VStack {
              TextField(
                "Token",
                text: viewStore.binding(\.$token)
              )
        Button(
          "Log In",
          action: {}
        )
      }
    }
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
