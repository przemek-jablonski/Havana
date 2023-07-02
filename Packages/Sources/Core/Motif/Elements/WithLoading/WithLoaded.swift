import Casimir
import SwiftUI

/**
 View that morphs it's content depending on the `data` state (switches between displaying "loading" view, "error" view and the actual content).
 */
public struct WithLoaded<LoadedView: View, Data: Equatable>: View {
  private var data: Loadable<Data>
  private let loadingPrompt: String?
  private let loadedView: (_ loaded: Data) -> LoadedView

  public init(
    _ data: Loadable<Data>,
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

private extension WithLoaded {
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

// TODO: does 'DEBUG' work
#if DEBUG
internal struct LoadingView_Previews: PreviewProvider {
  internal static var previews: some View {
    Group {
      WithLoaded(Loadable<String>.loaded(.random())) { loaded in
        loadedView(loaded)
      }

      WithLoaded(Loadable<String>.loading) { loaded in
        loadedView(loaded)
      }

      WithLoaded(Loadable<String>.loading, loadingPrompt: .random()) { loaded in
        loadedView(loaded)
      }

      WithLoaded(Loadable<String>.failure(GenericError(description: .random()))) { loaded in
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
