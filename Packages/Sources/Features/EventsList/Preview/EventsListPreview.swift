#if DEBUG
import ComposableArchitecture
import EventsListFeature
import SwiftUI

@main
internal struct EventsListPreview: App {
  internal var body: some Scene {
    WindowGroup("EventsListPreview") {
      NavigationStack {
        EventsListViewPreviews.preview
      }
    }
  }
}
#endif
