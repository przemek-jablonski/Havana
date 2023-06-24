import ActivityFeedFeature
import ComposableArchitecture
import Octokit
import SwiftUI

@main
internal struct ActivityFeedPreview: App {
  internal var body: some Scene {
    WindowGroup("ActivityFeedPreview") {
      NavigationStack {
        ActivityFeedView(
          Store(
            initialState: ActivityFeedReducer.State(
              user: .random(),
              publicEvents: .loading
            )
          ) {
            ActivityFeedReducer()
          }
        )
      }
    }
  }
}
