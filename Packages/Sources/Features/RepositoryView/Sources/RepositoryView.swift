import Casimir
import ComposableArchitecture
import Motif
import SwiftUI

public struct RepositoryView: View {
  public let store: StoreOf<RepositoryReducer>

  public init(
    _ store: StoreOf<RepositoryReducer>
  ) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(store) { viewStore in
      NavigationTitle(viewStore.displayName.ifEmpty(replaceWith: viewStore.fullName)) { [repository = viewStore.repository] in
        Text(String(describing: repository))
      }
      .task {
        viewStore.send(.user(.userNavigatedToRepositoryView))
      }
    }
  }
}

#if DEBUG
public struct RepositoryViewViewPreviews: PreviewProvider {
  /// Primary preview for `RepositoryViewView`, shared with standalone preview app as well.
  public static var preview: some View {
    RepositoryView(
      Store(
        initialState: .init(
          fullName: .random(),
          displayName: .random()
        )
      ) {
        RepositoryReducer()
          ._printChanges()
      }
    )
  }

  public static var previews: some View {
    preview
  }
}
#endif
