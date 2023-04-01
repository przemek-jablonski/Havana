import ActivityFeedFeature
import ComposableArchitecture
import Composables
import SwiftUI

public struct UserContextView: ComposableView {
  public let store: StoreOf<UserContextReducer>

  public init(
    _ store: StoreOf<UserContextReducer>
  ) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(self.store, observe: \.selectedTab) { viewStore in
      TabView(
        selection: viewStore.binding(
          send: { Action.user(.switchedTab($0)) }
        )
      ) {
        IfLetStore(
          store.scope(
            state: \.activityFeed,
            action: Action.activityFeed
          )
        ) {
          ActivityFeedView($0)
            .tabItem {
              Text("Activity")
            }
            .tag(State.Tab.activity)
        }
      }
      .onAppear {
        viewStore.send(.user(.lifecycle))
      }
    }
  }
}

internal struct UserContextViewPreviews: PreviewProvider {
  internal static var previews: some View {
    UserContextView(
      Store(
        initialState: UserContextReducer.State(
          selectedTab: .activity
        ),
        reducer: UserContextReducer()
      )
    )
  }
}
