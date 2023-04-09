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
    WithViewStore(store) { viewStore in
      LoadingView(
        for: viewStore.publicEvents,
        loadingView: { ProgressView() },
        failureView: { _ in Text("Error") }
      ) { publicEvents in
        List {
          ForEach(publicEvents.elements) { publicEvent in
            VStack {
              publicEvent.createdAt.map { createdAt in
                Text(createdAt.formatted())
                  .font(.caption)
              }

              Text(publicEvent.actor.login)

              Text(String(describing: publicEvent.type))

              Text(publicEvent.repo.name)

            }
          }
        }
      }
      .task {
        viewStore.send(.user(.lifecycle))
      }
    }
  }
}

import Casimir

public struct LoadingView<Model: Equatable, LoadingView: View, FailureView: View, LoadedView: View>: View {
  internal let loadableData: LoadableData<Model>
  internal let loadingView: () -> LoadingView
  internal let failureView: (Error) -> FailureView
  internal let loadedView: (Model) -> LoadedView

  public init(
    for loadableData: LoadableData<Model>,
    loadingView: @escaping () -> LoadingView,
    failureView: @escaping (Error) -> FailureView,
    loadedView: @escaping (Model) -> LoadedView
  ) {
    self.loadableData = loadableData
    self.loadingView = loadingView
    self.failureView = failureView
    self.loadedView = loadedView
  }

  public var body: some View {
    switch loadableData {
    case .loading:
      loadingView()
    case .failure(let error):
      failureView(error)
    case .loaded(let model):
      loadedView(model)
    }
  }
}

// private extension View

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
