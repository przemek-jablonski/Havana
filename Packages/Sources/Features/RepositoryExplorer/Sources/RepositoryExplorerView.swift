import ComposableArchitecture
import Motif
import Octokit
import SwiftUI

public struct RepositoryExplorerView: View {
  public let store: StoreOf<RepositoryExplorerReducer>

  public init(
    _ store: StoreOf<RepositoryExplorerReducer>
  ) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(store) { viewStore in
      List {
        switch viewStore.contents {
        case .loaded(let entities):
          ForEach(entities) { entity in
            Button {
              viewStore.send(.user(.userRequestedContentsOf(entity)))
            } label: {
              RepositoryEntityView(entity)
            }
          }

        case .loading:
          // TODO: get the exact number of "redacted"s from the Config somewhere (in /Motif perhaps)
          ForEach(Octokit.Repository.Entity.randoms()) { entity in
            RepositoryEntityView(entity)
          }
          .redacted(reason: .placeholder)

        case .failure(let error):
          Text(error.localizedDescription)
        }
      }
      .task {
        viewStore.send(.user(.userNavigatedToRepositoryExplorer))
      }
    }
  }
}
//      .toolbar {
//        ToolbarItem(placement: .principal) {
//          Text("Nav Title")
//            .monospaced()
//            .foregroundColor(Color.pink)
//        }
//      }

#if DEBUG
public struct RepositoryExplorerViewPreviews: PreviewProvider {
  /// Primary preview for `RepositoryExplorerView`, shared with standalone preview app as well.
  public static var preview: some View {
    RepositoryExplorerView(
      Store(
        initialState: RepositoryExplorerReducer.State(repository: .random())
      ) {
        RepositoryExplorerReducer()
          ._printChanges()
      }
    )
  }

  public static var previews: some View {
    preview
  }
}
#endif
