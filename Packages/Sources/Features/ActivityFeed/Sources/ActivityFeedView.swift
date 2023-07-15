import Casimir
import ComposableArchitecture
import EventsListFeature
import Motif
import Octokit
import ReleaseDetailsFeature
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
      NavigationStack {
        NavigationTitle("Following") {
          EventsListView(
            store.scope(
              state: \.eventsList,
              action: ActivityFeedReducer.Action.eventsList
            )
          )
          .navigationDestination(
            store: self.store.scope(state: \.$navigation, action: { ._navigation($0) }),
            state: /ActivityFeedReducer.Navigation.State.releaseDetails,
            action: ActivityFeedReducer.Navigation.Action.releaseDetails
          ) {
            ReleaseDetailsView($0)
          }
        }
        .task {
          viewStore.send(.user(.userNavigatedToActivityFeed))
        }
      }
    }
  }
}

#if DEBUG
internal struct ActivityFeedViewPreviews: PreviewProvider {
  /// Primary preview for `ActivityFeedView`, shared with standalone preview app as well.
  public static var preview: some View {
    ActivityFeedView(
      Store(
        initialState: ActivityFeedReducer.State(
          user: .random()
        ),
        reducer: ActivityFeedReducer()._printChanges()
      )
    )
  }

  public static var previews: some View {
    preview
  }
}
#endif
