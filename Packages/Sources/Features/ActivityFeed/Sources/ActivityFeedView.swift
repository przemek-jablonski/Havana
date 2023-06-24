import Casimir
import ComposableArchitecture
import Octokit
import SwiftUI

public struct ActivityFeedView: View {
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
          ForEach(publicEvents.elements) { _ in
            VStack {
              // TODO: TODO
              //              publicEvent.createdAt.map { createdAt in
              //                Text(createdAt.formatted())
              //                  .font(.caption)
              //              }

              //              Text(publicEvent.actor.login)
              //
              //              Text(String(describing: publicEvent.type))
              //
              //              Text(publicEvent.repo.name)

            }
          }
        }
      }
      .task {
        viewStore.send(.user(.task))
      }
    }
  }
}

public struct LoadingView<
  Model: Equatable,
  LoadingView: View,
  FailureView: View,
  LoadedView: View
>: View {
  internal let loadable: Loadable<Model>
  internal let loadingView: () -> LoadingView
  internal let failureView: (Error) -> FailureView
  internal let loadedView: (Model) -> LoadedView

  public init(
    for loadable: Loadable<Model>,
    loadingView: @escaping () -> LoadingView,
    failureView: @escaping (Error) -> FailureView,
    loadedView: @escaping (Model) -> LoadedView
  ) {
    self.loadable = loadable
    self.loadingView = loadingView
    self.failureView = failureView
    self.loadedView = loadedView
  }

  public var body: some View {
    switch loadable {
    case .loading:
      loadingView()
    case .failure(let error):
      failureView(error)
    case .loaded(let model):
      loadedView(model)
    }
  }
}

#if DEBUG
internal struct ActivityFeedViewPreviews: PreviewProvider {
  internal static var previews: some View {
    ActivityFeedView(
      Store(initialState: .init(user: .random(), publicEvents: .loading)) {
        ActivityFeedReducer()
      }
    )
  }
}
#endif
