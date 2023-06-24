import ActivityFeedFeature
import Casimir
import ComposableArchitecture
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
      with(loaded: viewStore.user) { _ in
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
                Text("Activity")
              }
              .tag(UserContextReducer.State.Tab.activity)
          }
        }
      }
      .task {
        await viewStore.send(.user(.userNavigatedToUserContext)).finish()
      }
    }
  }
}

// TODO: move to Motif
private extension View {
  @ViewBuilder
  func with<Content: View>(
    loaded user: Loadable<Octokit.User>?,
    content: (Octokit.User) -> Content
  ) -> some View {
    switch user {
    case .none, .some(.loading):
      ProgressView()
    case .some(.failure(let error)):
      Text(error.localizedDescription)
    case .some(.loaded(let user)):
      content(user)
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
