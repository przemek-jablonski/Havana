import Casimir
import ComposableArchitecture
import SwiftUI

public struct LoginView: View {
  private let store: StoreOf<LoginReducer>
  
//  struct ViewState: Equatable {
//    init(state: LoginReducer.State) {
//
//    }
//  }
  
  public init(
    store: StoreOf<LoginReducer>
  ) {
    self.store = store
  }
  
  public var body: some View {
    WithViewStore(store) { viewStore in
      ZStack {
        let _ = Self._printChanges()
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
    _ viewStore: ViewStoreOf<LoginReducer>
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
          case .greeting:
            Button("Login with Private Access Token") {
              viewStore.send(.userDidTapLoginWithPrivateAccessTokenButton)
            }
            .buttonStyle(.borderedProminent)
            .id(1)
            .transition(
              .slide.combined(with: .opacity)
              .animation(.easeOut)
            )
            
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
