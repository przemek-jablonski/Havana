import ActivityFeedFeature
import ComposableArchitecture
import SwiftUI
import Octokit

@main
internal struct ActivityFeedPreview: App {
  internal var body: some Scene {
    WindowGroup("ActivityFeedPreview") {
      NavigationStack {
        ActivityFeedView(
          Store(
            initialState: ActivityFeedReducer.State(
              user: .random,
              publicEvents: .loading
            ),
            reducer: ActivityFeedReducer(
              userService: Octokit.UserServiceMock.happyPath()
            )._printChanges()
          )
        )
      }
    }
  }
}