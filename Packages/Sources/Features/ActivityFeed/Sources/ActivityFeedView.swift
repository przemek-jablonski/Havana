import Casimir
import ComposableArchitecture
import Motif
import Octokit
import SwiftUI

public struct ActivityFeedView: View {
  public let store: StoreOf<ActivityFeedReducer>

  public init(
    _ store: StoreOf<ActivityFeedReducer>
  ) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(store) { viewStore in
      WithLoading(data: viewStore.publicEvents) { events in
        List {
          ForEach(events) { event in
            VStack {
              Text(String(describing: event))
            }
          }
        }
      }
      .task {
        viewStore.send(.user(.userNavigatedToActivityFeed))
      }
    }
  }
}

#if DEBUG
internal struct ActivityFeedViewPreviews: PreviewProvider {
  internal static var previews: some View {
    ActivityFeedView(
      Store(initialState: .init(user: .random(), publicEvents: .loading)) {
        ActivityFeedReducer()
      }
    )
  }
}
#endif

///
/// - event description                                              more
/// - author circular avatar (`release.author.avatarUrl`), xxx
/// - repository name (`release.htmlUrl -> extract`) xxxx
/// - tag (icon) name (1.1.0-alpha02) `release.name`
/// - draft / prerelease `release.draft / release.prerelease`
/// - body (cut to first x letters / "no description" if nil)  `release.body`
///
/// - timestamp (relative)
