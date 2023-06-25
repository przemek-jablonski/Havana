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
    switch data {
    case .loading:
      ProgressView {
        if let loadingPrompt {
          Text(loadingPrompt)
        }
      }
    case .failure(let error):
      Text(error.localizedDescription)
    case .loaded(let model):
      loadedView(model)
    }
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
