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
        .foregroundStyle(.secondary)
        .background(.ultraThinMaterial)
      }
    }
  }
}
