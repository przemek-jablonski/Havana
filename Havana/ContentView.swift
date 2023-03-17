import Combine
import ComposableArchitecture
import Casimir
import Octokit
import SwiftUI
import LoginFeature

struct ContentView: View {
  var body: some View {
    PrivateAccessTokenLoginView(
      store: Store(
        initialState: PrivateAccessTokenLogin.State.tokenInput,
        reducer: PrivateAccessTokenLogin(loginService: .Mock.loginSuccessful)._printChanges()
      )
    )
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
