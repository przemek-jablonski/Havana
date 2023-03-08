import Casimir
import ComposableArchitecture
import SwiftUI

public struct LoginView: View {
  private let store: StoreOf<LoginReducer>
  
  struct ViewState: Equatable {
    init(state: LoginReducer.State) {

    }
  }
  
  public init(
    store: StoreOf<LoginReducer>
  ) {
    self.store = store
  }
  
  public var body: some View {
    WithViewStore(store, observe: ViewState.init) { viewStore in
      ZStack {
        gradientBackground()
          .ignoresSafeArea()
        
        overlay(viewStore)
          .maxHeight(.infinity)
        
//        Text(viewStore.rawValue)
      }
    }
  }
}

private extension View {
  @ViewBuilder
  func gradientBackground() -> some View {
    LinearGradient(
      stops: [
        .init(color: Color.red, location: .zero),
        .init(color: Color.green, location: 1)
      ],
      startPoint: .bottomLeading,
      endPoint: .topTrailing
    )
    .opacity(0.33)
  }
  
  @ViewBuilder
  func overlay(
    _ viewStore: ViewStore<LoginView.ViewState, LoginReducer.Action>
  ) -> some View {
    VStack {
      VStack {
        VStack {}
        .maxHeight(.infinity)
        
        VStack {
          Text("Welcome to Havana, your new GitHub client.")
            .font(.title)
        }
        .multilineTextAlignment(.center)
        .maxHeight(.infinity)
      }
      .maxHeight(.infinity)
      
      VStack {
        Button("Login with Private Access Token") {
          viewStore.send(.userDidTapLoginWithPrivateAccessTokenButton)
        }
        .buttonStyle(.borderedProminent)
        
        Button("Login with GitHub.com") {
          viewStore.send(.userDidTapLoginWithGithubButton)
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
        initialState: LoginReducer.State.greeting,
        reducer: LoginReducer()
      )
    )
  }
}
