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
    WithViewStore(store) { viewStore in
      VStack {
        Button("Private Access Token") {
          viewStore.send(.userDidTapLoginWithPrivateAccessTokenButton)
        }

        Button("Login with Github") {
          viewStore.send(.userDidTapLoginWithGithubButton)
        }
      }
    }
  }
}

private extension View {
  @ViewBuilder
  func overlay(
    _ viewStore: ViewStoreOf<Login>
  ) -> some View {
    VStack {
      VStack {
        VStack {}
          .maxHeight(.infinity)

        VStack {
          Text("ble ble ble")
            .font(.title)
        }
        .multilineTextAlignment(.center)
        .maxHeight(.infinity)
      }
      .maxHeight(.infinity)

      VStack {
        switch viewStore.state {
        case .loginFlowSelection:
          //            Button("Login with Private Access Token") {
          //              viewStore.send(.userDidTapLoginWithPrivateAccessTokenButton(.))
          //            }
          //            .buttonStyle(.borderedProminent)
          //            .id(1)
          //            .transition(
          //              .slide.combined(with: .opacity)
          //              .animation(.easeOut)
          //            )

          Button("Login with GitHub.com") {
            viewStore.send(.userDidTapLoginWithGithubButton)
          }
          .id(2)
          .transition(
            .slide.combined(with: .opacity)
              .animation(.easeOut)
          )
        case .privateAccessTokenLoginFlow:
          Text("PAT")
            .id(1)
            .transition(
              .slide.combined(with: .opacity)
                .animation(.easeOut)
            )
        case .oauthLoginFlow:
          Text("Oauth")
            .id(1)
            .transition(
              .slide.combined(with: .opacity)
                .animation(.easeOut)
            )
        default:
          EmptyView()
        }

      }
      .maxHeight(.infinity)
    }
    .padding()
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView(
      store: Store(
        initialState: Login.State.loginFlowSelection,
        reducer: Login(loginService: Octokit.LoginServiceMock.happyPath())
      )
    )
  }
}
