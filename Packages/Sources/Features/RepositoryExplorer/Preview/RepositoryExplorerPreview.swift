#if DEBUG
import ComposableArchitecture
import RepositoryExplorerFeature
import SwiftUI

@main
internal struct RepositoryExplorerPreview: App {
  internal var body: some Scene {
    WindowGroup("RepositoryExplorerPreview") {
      NavigationStack {
        RepositoryExplorerViewPreviews.preview
      }
    }
  }
}
#endif
