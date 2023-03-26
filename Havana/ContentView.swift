import Casimir
import Combine
import ComposableArchitecture
import LoginFeature
import Octokit
import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      LoginView(
        store: Store(
          initialState: Login.State.loginFlowSelection,
          reducer: Login(loginService: Octokit.LoginServiceMock.happyPath())._printChanges()
        )
      )
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
