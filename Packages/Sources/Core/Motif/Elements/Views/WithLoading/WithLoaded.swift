import Casimir
import SwiftUI
/**
 List that morphs it's content depending on the data state passed as input (switches between displaying "loading" view, "error" view and the actual content).
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
        if loadables.isLoading || loadables.isFailure {
          ForEach((0..<placeholdersCount).map { _ in Model.random() }.unique()) { model in
            loadedView(model)
          }
          .listRowSeparator(.hidden)
          .redacted(reason: .placeholder)
          .opacity(0.50)
        }

        if case Loadable.loaded(let loaded) = loadables {
          ForEach(loaded) { element in
            loadedView(element)
          }
          .listRowSeparator(.hidden)
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
        .foregroundStyle(.secondary)
        .background(.ultraThinMaterial)
      }

      if case Loadable.loading = loadables {
        VStack {
          ProgressView()
        }
        .padding(64)
        .padding(.horizontal)
        .foregroundStyle(.secondary)
        .background(.ultraThinMaterial)
        .cornerRadius(8)
        .shadow(radius: 12)
      }
    }
  }
}

// #if DEBUG
// internal struct WithLoadedPreviews: PreviewProvider {
//  struct TestModel:
//  static var previews: some View {
//    WithLoaded(Loadable<String>.loading) { element in
//      Text(element)
//    }
//  }
// }
// #endif
