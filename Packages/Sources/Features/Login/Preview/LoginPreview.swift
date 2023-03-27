import ComposableArchitecture
import LoginFeature
import Octokit
import SwiftUI

@main
struct LoginPreview: App {
  var body: some Scene {
    WindowGroup {
      NavigationView {
        LoginView(
          Store(
            initialState: LoginReducer.State(),
            reducer: LoginReducer(
              loginService: Octokit.LoginServiceMock.happyPath()
            )
          )
        )
        .navigationTitle("Login")
      }
    }
  }
}
