import ComposableArchitecture
import Composables
import SwiftUI

public struct ActivityFeedView: ComposableView {
  public let store: StoreOf<ActivityFeedReducer>

  public init(
    _ store: StoreOf<ActivityFeedReducer>
  ) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(self.store) { _ in
      Text("ActivityFeed")
        .font(.title)
    }
  }
}

internal struct ActivityFeedViewPreviews: PreviewProvider {
  internal static var previews: some View {
    ActivityFeedView(
      Store(
        initialState: ActivityFeedReducer.State(),
        reducer: ActivityFeedReducer()
      )
    )
  }
}
