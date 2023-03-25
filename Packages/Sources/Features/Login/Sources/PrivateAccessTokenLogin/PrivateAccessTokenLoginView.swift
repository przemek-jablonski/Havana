import ComposableArchitecture
import Octokit
import SwiftUI

public struct PrivateAccessTokenLoginView: View {
  private let store: StoreOf<PrivateAccessTokenLoginReducer>

  @State private var token: String = ""

  public init(
    _ store: StoreOf<PrivateAccessTokenLoginReducer>
  ) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(self.store) { viewStore in
      VStack {
        TextField("Token", text: $token)
        Button("Log in") {
          viewStore.send(.userRequestedLoginUsingToken(token: token))
        }
      }
    }
    //    WithViewStore(
    //      store,
    //      observe: ViewState.extractViewState(from:)
    //      //      ,
    //      //      send: ViewAction.convertToReducerAction(using:)
    //    ) { viewStore in
    //      VStack {
    //        TextField("Token", text: $token)
    //        Button("Log In", action: { viewStore.send(.userRequestedLoginUsingToken(token: token)) })
    //      }
    //      .padding()
    //    }
  }
}

// internal struct PrivateAccessTokenLogin_Previews: PreviewProvider {
//  static var previews: some View {
//    PrivateAccessTokenLoginView(
//      store: Store(
//        initialState: PrivateAccessTokenLogin.State.tokenInputForm,
//        reducer: PrivateAccessTokenLogin(loginService: Octokit.LoginServiceMock.happyPath())
//      )
//    )
//  }
// }
