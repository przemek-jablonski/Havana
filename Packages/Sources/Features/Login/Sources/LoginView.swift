import Casimir
import ComposableArchitecture
import Octokit
import SwiftUI
import SwiftUINavigation

public struct LoginView: View {
  private let store: StoreOf<LoginReducer>

  public init(
    _ store: StoreOf<LoginReducer>
  ) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(self.store) { viewStore in
      NavigationLink(
        unwrapping: viewStore.binding(
          get: \.privateAccessTokenLogin,
          send: { _ in .userDismissedPrivateAccessTokenLoginFlow }
        ).removeDuplicates(),
        onNavigate: { if $0 { viewStore.send(.userRequestedPrivateAccessTokenLoginFlow) }},
        destination: { _ in
          IfLetStore(
            store.scope(
              state: \.privateAccessTokenLogin,
              action: LoginReducer.Action.privateAccessTokenLogin
            )
          ) {
            PrivateAccessTokenLoginView($0)
          }
        },
        label: {
          Text("pat")
        }
      )

      NavigationLink(
        unwrapping: viewStore.binding(
          get: \.oAuthLogin,
          send: { _ in .userDismissedOAuthLoginFlow }
        ).removeDuplicates(),
        onNavigate: { if $0 { viewStore.send(.userRequestedOAuthLoginFlow) }},
        destination: { _ in
          IfLetStore(
            store.scope(
              state: \.oAuthLogin,
              action: LoginReducer.Action.oAuthLogin
            )
          ) {
            OAuthLoginView($0)
          }
        },
        label: {
          Text("oauth")
        }
      )
    }
  }
}

// private extension View {
//  func link(
//
//  ) -> some View {
//    NavigationLink(
//      unwrapping: viewStore.binding(
//        get: \.privateAccessTokenLogin,
//        send: { _ in .userDismissedPrivateAccessTokenLoginFlow }
//      ).removeDuplicates(),
//      onNavigate: { if $0 { viewStore.send(.userRequestedPrivateAccessTokenLoginFlow) }},
//      destination: { _ in
//        IfLetStore(
//          store.scope(
//            state: \.privateAccessTokenLogin,
//            action: LoginReducer.Action.privateAccessTokenLogin
//          )
//        ) {
//          PrivateAccessTokenLoginView($0)
//        }
//      },
//      label: {
//        Text("pat")
//      }
//    )
//  }
// }
