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
    WithViewStore(store) { viewStore in
      with(viewStore.user) { user in
        TabView(
          selection:
            viewStore.binding(
              get: \.selectedTab,
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
      }
      .onAppear {
        viewStore.send(.user(.lifecycle))
      }
    }
  }
}

private extension View {
  @ViewBuilder
  func with<Content: View>(
    _ user: LoadableData<Octokit.User>?,
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
      Store(
        initialState: UserContextReducer.State(
          selectedTab: .activity
        ),
        reducer: UserContextReducer(
          userService: Octokit.UserServiceMock.happyPath()
        )._printChanges()
      )
    )
  }

  public static var previews: some View {
    preview
  }
}
#endif
