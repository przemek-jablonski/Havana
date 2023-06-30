import ActivityFeedFeature
import ComposableArchitecture
import Octokit
import SwiftUI

@main
internal struct ActivityFeedPreview: App {
  internal var body: some Scene {
    PreviewScene("ActivityFeedPreview") {
      ActivityFeedView(
        Store(initialState: ActivityFeedReducer.State(user: .random())) {
          ActivityFeedReducer()
        }
      )
    }
  }
}

// TODO: update Casimir with this
// TODO: maybe create Casimir-Previews
private struct PreviewScene<Content: View>: Scene {
  let windowName: String
  let content: () -> Content

  init(
    _ windowName: String,
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.windowName = windowName
    self.content = content
  }

  var body: some Scene {
    WindowGroup(windowName) {
      NavigationSplitView(
        columnVisibility: .constant(.detailOnly),
        sidebar: { EmptyView() }
      ) {
        content()
      }
    }
  }
}

extension Octokit.EventsService: DependencyKey {
  public static let liveValue: Octokit.EventsService = {
    Self(
      allPublicEvents: unimplemented(),
      userEvents: { _, _ in
        [
          Octokit.Event.releaseEvent(.random()),
          Octokit.Event.releaseEvent(.random()),
          Octokit.Event.releaseEvent(.random()),
          Octokit.Event.releaseEvent(.random()),
          Octokit.Event.releaseEvent(.random()),
          Octokit.Event.releaseEvent(.random()),
          Octokit.Event.releaseEvent(.random()),
          Octokit.Event.releaseEvent(.random()),
          Octokit.Event.releaseEvent(.random()),
          Octokit.Event.releaseEvent(.random()),
          Octokit.Event.releaseEvent(.random()),
          Octokit.Event.releaseEvent(.random()),
          Octokit.Event.releaseEvent(.random())
        ]
      }
    )
  }()
}
