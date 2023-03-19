import ComposableArchitecture
import LoginFeature
import Octokit
import SwiftUI

@main
struct Preview: App {
  var body: some Scene {
    WindowGroup {
      LoginView(
        store: Store(
          initialState: Login.State.loginFlowSelection,
          reducer: Login(loginService: Octokit.LoginServiceMock.happyPath())
        )
      )
    }
  }
}
