import Casimir
import ComposableArchitecture
import Octokit
import SwiftUI
import SwiftUINavigation

public struct LoginView: View {
  private let store: StoreOf<Login>

  public init(
    store: StoreOf<Login>
  ) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(self.store) { viewStore in
      let asd = Self._printChanges()
      VStack {
        NavigationLink(
          destination: IfLetStore(
            self.store.scope(
              state: \.privateAccessTokenLogin,
              action: { Login.Action.privateAccessTokenLogin($0) }
            ),
            then: { scopedStore in
              PrivateAccessTokenLoginView(
                store: scopedStore
              )
            },
            else: {
              Text("nil")
            }
          ),
          label: {
            Button("PAT") {
              viewStore.send(.privateAccessTokenLoginSelected)
            }
          }
        )

        NavigationLink(
          destination: IfLetStore(
            self.store.scope(
              state: \.oAuthLogin,
              action: Login.Action.oAuthLogin
            ),
            then: { scopedStore in
              OAuthLoginView(
                store: scopedStore
              )
            }
          ),
          label: {
            Button("oAuth") {
              viewStore.send(.oAuthLoginSelected)
            }
          }
        )
      }
    }
    //    NavigationLink(
    //      destination: PrivateAccessTokenLoginView(
    //        store: self.store.scope(
    //          state: \.privateAccessTokenLogin,
    //          action: Login.Action.privateAccessTokenLogin
    //        )
    //      ),
    //      label: {
    //        Text("PAT")
    //      }
    //    )
    //    NavigationLink(
    //      destination:
    ////        IfLetStore(
    //
    //        self.store.scope(
    //          state: \.privateAccessTokenLogin,
    //          action: /Login.Action.privateAccessTokenLogin),
    ////        then: PrivateAccessTokenLoginView.init(store: )
    ////      )
    //    ,
    //      label: {
    //        Text("PAT")
    //      }
    //    )
  }
}
