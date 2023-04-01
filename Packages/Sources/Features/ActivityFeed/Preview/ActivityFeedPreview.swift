import ActivityFeedFeature
import ComposableArchitecture
import SwiftUI

@main
internal struct ActivityFeedPreview: App {
  internal var body: some Scene {
    WindowGroup {
      NavigationView {
        ActivityFeedView(
          Store(
            initialState: ActivityFeedReducer.State(),
            reducer: ActivityFeedReducer()
          )
        )
        .navigationTitle("ActivityFeed Preview")
      }
    }
  }
}
