import ComposableArchitecture
import Octokit
import SwiftUI

private extension PrivateAccessTokenLoginView {
  struct ViewState: Equatable {
    var isLoginInProgress: Bool
    var errorText: String?
    
    static func extractViewState(from reducerState: PrivateAccessTokenLogin.State) -> Self {
      switch reducerState {
        case .tokenInput:
          return PrivateAccessTokenLoginView.ViewState(
            isLoginInProgress: false,
            errorText: nil
          )
        case .loginInProgress:
          return PrivateAccessTokenLoginView.ViewState(
            isLoginInProgress: true,
            errorText: nil
          )
        case .tokenInputRetry(_, let failureReason):
          return PrivateAccessTokenLoginView.ViewState(
            isLoginInProgress: false,
            errorText: String(describing: failureReason) // TODO: 
          )
      }
    }
  }
}

private extension PrivateAccessTokenLoginView {
  enum ViewAction: Equatable {
    case userDidRequestLoginUsingToken(token: String)
    
    static func convertToReducerAction(using viewAction: ViewAction) -> PrivateAccessTokenLogin.Action {
      switch viewAction {
        case .userDidRequestLoginUsingToken(let token):
          return .userDidRequestLoginUsingToken(token: token)
      }
    }
  }
}

public struct PrivateAccessTokenLoginView: View {
  
  @State private var token: String = ""
  private let store: StoreOf<PrivateAccessTokenLogin>
  
  public init(store: StoreOf<PrivateAccessTokenLogin>) {
    self.store = store
  }
  
  public var body: some View {
    WithViewStore(
      store,
      observe: ViewState.extractViewState(from:)
//      ,
//      send: ViewAction.convertToReducerAction(using:)
    ) { viewStore in
      VStack {
        TextField("Token", text: $token)
        Button("Log In", action: { viewStore.send(.userDidRequestLoginUsingToken(token: token)) })
      }
      .padding()
    }
  }
}

struct PrivateAccessTokenLogin_Previews: PreviewProvider {
  static var previews: some View {
    PrivateAccessTokenLoginView(
      store: Store(
        initialState: PrivateAccessTokenLogin.State.tokenInput,
        reducer: PrivateAccessTokenLogin(loginService: Octokit.LoginService.Mock.loginSuccessful)
      )
    )
  }
}
