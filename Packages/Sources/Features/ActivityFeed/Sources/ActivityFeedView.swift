import Casimir
import ComposableArchitecture
import Octokit
import Motif
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
