import Casimir
import SwiftUI

/**
 View that morphs it's content depending on the `data` state (switches between displaying "loading" view, "error" view and the actual content).
 */
public struct WithLoading<LoadedView: View, Data: Equatable>: View {
  private var data: Loadable<Data>
  private let loadingPrompt: String?
  private let loadedView: (_ loaded: Data) -> LoadedView
  private let task: (() async -> ())?
  @State private var isFirstTaskLaunched = false

  public init(
    data: Loadable<Data>,
    loadingPrompt: String? = nil, // TODO: loading prompt should be mandatory to include
    @ViewBuilder loadedView: @escaping (_ loaded: Data) -> LoadedView,
    task: (() async -> ())? = nil
  ) {
    self.data = data
    self.loadingPrompt = loadingPrompt
    self.loadedView = loadedView
    self.task = task
  }

  public var body: some View {
    Group {
      if case Loadable.loading = data {
        loadingView()
      } else if case Loadable.failure(let error) = data {
        errorView(error)
      } else if case Loadable.loaded(let data) = data {
        loadedView(data)
      }
    }
    .task {
      if !isFirstTaskLaunched {
        isFirstTaskLaunched = true
        await task?()
      }
    }
  }
}

private extension WithLoading {
  @ViewBuilder
  func loadingView() -> some View {
    ProgressView {
      if let loadingPrompt {
        Text(loadingPrompt)
      }
    }
  }

  @ViewBuilder
  func errorView(_ error: Error) -> some View {
    Text(error.localizedDescription)
  }
}

#if DEBUG
internal struct LoadingView_Previews: PreviewProvider {
  internal static var previews: some View {
    Group {
      WithLoading(data: Loadable<String>.loaded(.random())) { loaded in
        loadedView(loaded)
      }

      WithLoading(data: Loadable<String>.loading) { loaded in
        loadedView(loaded)
      }

      WithLoading(data: Loadable<String>.loading, loadingPrompt: .random()) { loaded in
        loadedView(loaded)
      }

      WithLoading(data: Loadable<String>.failure(GenericError(description: .random()))) { loaded in
        loadedView(loaded)
      }
    }
  }

  @ViewBuilder
  private static func loadedView(
    _ string: String
  ) -> some View {
    Label(string, systemImage: "paperplane.circle.fill")
      .padding()
      .background(Color.random)
  }
}
#endif
