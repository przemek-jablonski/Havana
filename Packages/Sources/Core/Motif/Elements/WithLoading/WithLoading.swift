import Casimir
import SwiftUI

/**
 View that morphs it's content depending on the `data` state (switches between displaying "loading" view, "error" view and the actual content).
 */
public struct WithLoading<LoadedView: View, Data: Equatable>: View {
  private let data: Loadable<Data>
  private let loadedView: (_ loaded: Data) -> LoadedView
  private let loadingPrompt: String?

  public init(
    data: Loadable<Data>,
    loadingPrompt: String? = nil, // TODO: loading prompt should be mandatory to include
    @ViewBuilder loadedView: @escaping (_ loaded: Data) -> LoadedView
  ) {
    self.data = data
    self.loadingPrompt = loadingPrompt
    self.loadedView = loadedView
  }

  public var body: some View {
    if case Loadable.loading = data {
      loadingView()
    }

    if case Loadable.failure(let error) = data {
      errorView(error)
    }

    if case Loadable.loaded(let data) = data {
      loadedView(data)
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
  @State static var content = Loadable<String>.loading
  internal static var previews: some View {
    Group {
      if #available(iOS 16.0, *) {
        WithLoading(data: content) { loaded in
          loadedView(loaded)
        }.task {
          try? await Task.sleep(for: .seconds(2))
          content = .loaded("Loaded!")
        }
      }

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
