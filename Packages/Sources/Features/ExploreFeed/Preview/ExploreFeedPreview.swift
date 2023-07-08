#if DEBUG
import ExploreFeedFeature
import ComposableArchitecture
import SwiftUI

@main
internal struct ExploreFeedPreview: App {
  internal var body: some Scene {
    WindowGroup("ExploreFeedPreview") {
      NavigationStack {
        ExploreFeedViewPreviews.preview
      }
    }
  }
}
#endif
