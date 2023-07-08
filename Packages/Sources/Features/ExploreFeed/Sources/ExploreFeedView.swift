import ComposableArchitecture
import SwiftUI

public struct ExploreFeedView {
  public let store: StoreOf<ExploreFeedReducer>

  public init(
    _ store: StoreOf<ExploreFeedReducer>
  ) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(store) { _ in
      Text("ExploreFeed")
        .font(.title)
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
