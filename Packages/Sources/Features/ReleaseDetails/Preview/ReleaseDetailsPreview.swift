#if DEBUG
import ComposableArchitecture
import ReleaseDetailsFeature
import SwiftUI

@main
internal struct ReleaseDetailsPreview: App {
  internal var body: some Scene {
    WindowGroup("ReleaseDetailsPreview") {
      NavigationStack {
        ReleaseDetailsViewPreviews.preview
      }
    }
  }
}
#endif
