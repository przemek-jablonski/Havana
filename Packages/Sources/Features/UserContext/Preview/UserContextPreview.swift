#if DEBUG // TODO: check if this debug even works
import ComposableArchitecture
import SwiftUI
import UserContextFeature

@main
internal struct UserContextPreview: App {
  internal var body: some Scene {
    WindowGroup("UserContextPreview") {
      NavigationStack {
        UserContextViewPreviews.preview

      }
    }
  }
}
#endif
