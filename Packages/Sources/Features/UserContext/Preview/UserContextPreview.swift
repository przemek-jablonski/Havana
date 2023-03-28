import ComposableArchitecture
import SwiftUI
import UserContextFeature

@main
internal struct UserContextPreview: App {
  internal var body: some Scene {
    WindowGroup {
      NavigationView {
        UserContextView(
          Store(
            initialState: UserContextReducer.State(),
            reducer: UserContextReducer()
          )
        )
        .navigationTitle("UserContext Preview")
      }
    }
  }
}
