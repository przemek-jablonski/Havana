// import Casimir
// import ComposableArchitecture
// import Octokit
// import SwiftUI
//
// public struct LoginView: View {
//  private let store: StoreOf<Login>
//
//  public init(
//    store: StoreOf<Login>
//  ) {
//    self.store = store
//  }
//
//  public var body: some View {
//    Text("asd")
////    SwitchStore(self.store) {
////      CaseLet(
////        state: /Login.State.loginFlowSelection,
////        action: /Login.Action.loginFlowSelectionAction
////      ) { store in
////
////      }
////    }
//    //    WithViewStore(self.store) { viewStore in
//    //
//    ////      if viewStore.state == .loginFlowSelection {
//    //        VStack {
//    //          NavigationLink("Login with Private Access Token") {
//    //
//    //            PrivateAccessTokenLoginView(
//    //              store: store.scope(
//    //                state: /Login.State.privateAccessTokenLoginFlow,
//    //                action: { .privateAccessTokenLoginFlowAction($0) }
//    //              )
//    //            )
//    //          }
//    //
//    //          Button("Login with Private Access Token") {
//    //            viewStore.send(.userDidTapLoginWithPrivateAccessTokenButton)
//    //          }
//    //
//    //          Button("Login with Github") {
//    //            viewStore.send(.userDidTapLoginWithGithubButton)
//    //          }
//    //        }
//    ////      }
//    //    }
//  }
// }
//
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
