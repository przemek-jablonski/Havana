#if DEBUG
import ComposableArchitecture
import ExploreFeedFeature
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
