#if DEBUG
import ComposableArchitecture
import RepositoryViewFeature
import SwiftUI

@main
internal struct RepositoryViewPreview: App {
  internal var body: some Scene {
    WindowGroup("RepositoryViewPreview") {
      NavigationStack {
        RepositoryViewViewPreviews.preview
      }
    }
  }
}
#endif
