import ActivityFeedFeature
import Casimir
import ComposableArchitecture
import ExploreFeedFeature
import Motif
import Octokit
import SwiftUI

public struct UserContextView: View {

  public let store: StoreOf<UserContextReducer>

  public init(
    _ store: StoreOf<UserContextReducer>
  ) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(store) { viewStore in
      TabView(
        selection:
          viewStore.binding(
            get: \.selectedTab,
            send: { UserContextReducer.Action.user(.userSwitchedTab($0)) }
          )
      ) {
        IfLetStore(
          store.scope(
            state: \.activityFeed,
            action: UserContextReducer.Action.activityFeed
          )
        ) {
          ActivityFeedView($0)
            .tabItem {
              Image(systemName: "person.3.fill")
                .symbolRenderingMode(.hierarchical)
              Text("Activity")
            }
            .tag(UserContextReducer.State.Tab.activity)
        }

        IfLetStore(
          store.scope(
            state: \.exploreFeed,
            action: UserContextReducer.Action.exploreFeed
          )
        ) {
          ExploreFeedView($0)
            .tabItem {
              Image(systemName: "globe.europe.africa")
                .symbolRenderingMode(.hierarchical)
              Text("Explore")
            }
            .tag(UserContextReducer.State.Tab.activity)
        }
      }
      .task {
        viewStore.send(.user(.userNavigatedToUserContext))
      }
    }
  }
}

#if DEBUG
public struct UserContextViewPreviews: PreviewProvider {
  public static var preview: some View {
    UserContextView(
      Store(initialState: UserContextReducer.State()) {
        UserContextReducer()
      }
    )
  }

  public static var previews: some View {
    preview
  }
}
#endif
