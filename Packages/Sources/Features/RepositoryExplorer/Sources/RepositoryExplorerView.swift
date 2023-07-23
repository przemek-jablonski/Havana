import ComposableArchitecture
import SwiftUI

public struct RepositoryExplorerView: View {
  public let store: StoreOf<RepositoryExplorerReducer>

  public init(
    _ store: StoreOf<RepositoryExplorerReducer>
  ) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(store) { _ in
      Text("RepositoryExplorer")
        .font(.title)
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
        initialState: RepositoryExplorerReducer.State()
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
