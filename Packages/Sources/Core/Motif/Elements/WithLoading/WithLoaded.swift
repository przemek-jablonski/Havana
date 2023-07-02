import Casimir
import SwiftUI

/**
 List that morphs it's content depending on the `data` state (switches between displaying "loading" view, "error" view and the actual content).
 */
public struct WithLoaded<
  Model: ModelProtocol,
  Container: Collection & Equatable & RandomAccessCollection,
  LoadedView: View
>: View where Container.Element == Model {

  private let placeholdersCount = 10

  private var loadables: Loadable<Container>
  private var loadedView: (_ element: Model) -> LoadedView

  public init(
    _ loadables: Loadable<Container>,
    @ViewBuilder loadedView: @escaping (_ element: Model) -> LoadedView
  ) {
    self.loadables = loadables
    self.loadedView = loadedView
  }

  public var body: some View {
    ZStack {
      List {
        if loadables.isLoading {
          ForEach((0..<placeholdersCount).map { _ in Model.random() }) { model in
            loadedView(model)
          }
          .listRowSeparator(.hidden)
          .listRowInsets(.zero)
          .redacted(reason: .placeholder)
        }

        if case Loadable.loaded(let loaded) = loadables {
          ForEach(loaded) { element in
            loadedView(element)
          }
          .listRowSeparator(.hidden)
          .listRowInsets(.zero)
        }
      }
      .listStyle(.plain)

      if case Loadable.failure(let error) = loadables {
        VStack {
          Image(systemName: "xmark.circle.fill")
          Text(error.localizedDescription)
        }
        .padding()
        .padding(.vertical)
        .foregroundColor(.secondary)
        .background(.ultraThinMaterial)
      }
    }
  }
}

//// TODO: does 'DEBUG' work
// #if DEBUG
// internal struct LoadingView_Previews: PreviewProvider {
//  internal static var previews: some View {
//    Group {
//      WithLoaded(Loadable<String>.loaded(.random())) { loaded in
//        loadedView(loaded)
//      }
//
//      WithLoaded(Loadable<String>.loading) { loaded in
//        loadedView(loaded)
//      }
//
//      WithLoaded(Loadable<String>.loading, loadingPrompt: .random()) { loaded in
//        loadedView(loaded)
//      }
//
//      WithLoaded(Loadable<String>.failure(GenericError(description: .random()))) { loaded in
//        loadedView(loaded)
//      }
//    }
//  }
//
//  @ViewBuilder
//  private static func loadedView(
//    _ string: String
//  ) -> some View {
//    Label(string, systemImage: "paperplane.circle.fill")
//      .padding()
//      .background(Color.random)
//  }
// }
// #endif
