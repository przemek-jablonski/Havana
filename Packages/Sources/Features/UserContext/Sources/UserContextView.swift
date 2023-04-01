import ActivityFeedFeature
import Casimir
import ComposableArchitecture
import Composables
import SwiftUI
import Octokit

public struct UserContextView: ComposableView {
  public let store: StoreOf<UserContextReducer>

  public init(
    _ store: StoreOf<UserContextReducer>
  ) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(self.store) { viewStore in
      user(viewStore.user)
//      switch viewStore.user {
//        case .loading:
//          Text("loading")
//        case .failure(let error):
//          Text(error.localizedDescription)
//        case .loaded(let data):
//          Text("loaded")
//      }
//      TabView(
//        selection: viewStore.selectedTab.binding(
//          send: { Action.user(.switchedTab($0)) }
//        )
//      ) {
//        IfLetStore(
//          store.scope(
//            state: \.activityFeed,
//            action: Action.activityFeed
//          )
//        ) {
//          ActivityFeedView($0)
//            .tabItem {
//              Text("Activity")
//            }
//            .tag(State.Tab.activity)
//        }
//      }
      .onAppear {
        viewStore.send(.user(.lifecycle))
      }
    }
  }
}

private extension View {
   // TODO: name it better
  @ViewBuilder
  func user(_ user: LoadableDataOf<Octokit.User>) -> some View {
    switch user {
      case .loading:
        Text("loading")
      case .failure(let error):
        Text(error.localizedDescription)
      case .loaded(let data):
        Text("loaded")
    }
  }
}

#if DEBUG
public struct UserContextViewPreviews: PreviewProvider {
  public static var preview: some View {
    UserContextView(
      Store(
        initialState: UserContextReducer.State(
          selectedTab: .activity
        ),
        reducer: UserContextReducer()
      )
    )
  }

  public static var previews: some View {
    preview
  }
}
#endif
