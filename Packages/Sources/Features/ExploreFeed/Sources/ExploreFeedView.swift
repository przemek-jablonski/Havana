import ComposableArchitecture
import EventsListFeature
import SwiftUI

public struct ExploreFeedView: View {
  public let store: StoreOf<ExploreFeedReducer>

  public init(
    _ store: StoreOf<ExploreFeedReducer>
  ) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(store) { viewStore in
      EventsListView(
        store.scope(
          state: \.eventsList,
          action: ExploreFeedReducer.Action.eventsList
        )
      )
      .task {
        viewStore.send(.user(.userNavigatedToExploreFeed))
      }
    }
  }
}

#if DEBUG
public struct ExploreFeedViewPreviews: PreviewProvider {
  /// Primary preview for `ExploreFeedView`, shared with standalone preview app as well.
  public static var preview: some View {
    ExploreFeedView(
      Store(
        initialState: ExploreFeedReducer.State(),
        reducer: ExploreFeedReducer()._printChanges()
      )
    )
  }

  public static var previews: some View {
    preview
  }
}
#endif
