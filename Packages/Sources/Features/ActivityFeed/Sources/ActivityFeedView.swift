import ComposableArchitecture
import Composables
import Octokit
import SwiftUI

public struct ActivityFeedView: ComposableView {
  public let store: StoreOf<ActivityFeedReducer>

  public init(
    _ store: StoreOf<ActivityFeedReducer>
  ) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(self.store) { viewStore in
      Text("ActivityFeedView")
      .task {
        viewStore.send(.user(.lifecycle))
      }
    }
  }
}

internal struct ActivityFeedViewPreviews: PreviewProvider {
  internal static var previews: some View {
    ActivityFeedView(
      Store(
        initialState: ActivityFeedReducer.State(
          user: .random,
          publicEvents: .loading
        ),
        reducer: ActivityFeedReducer(
          userService: Octokit.UserServiceMock.happyPath()
        )
      )
    )
  }
}
