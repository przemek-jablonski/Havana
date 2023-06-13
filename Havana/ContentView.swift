import Casimir
import Combine
import ComposableArchitecture
import LoginFeature
import Octokit
import SwiftUI

internal struct ContentView: View {
  internal var body: some View {
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

internal struct ContentView_Previews: PreviewProvider {
  internal static var previews: some View {
    ContentView()
  }
}
