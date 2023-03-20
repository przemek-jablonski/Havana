import ComposableArchitecture
import LoginFeature
import Octokit
import SwiftUI

@main
struct LoginPreview: App {
  var body: some Scene {
    WindowGroup {
      NavigationView {
        Text("asd")
        //        LoginView(
        //          store: Store(
        //            initialState: Login.State.loginFlowSelection,
        //            reducer: Login(loginService: Octokit.LoginServiceMock.happyPath())
        //          )
        //        )
        //        .navigationTitle("Login")
      }
    }
  }
}
