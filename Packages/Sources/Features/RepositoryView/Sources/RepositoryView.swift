import Casimir
import ComposableArchitecture
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
      NavigationTitle(viewStore.repository.name) { [repository = viewStore.repository] in
        Text(repository.fullName)
          .monospaced()
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
        initialState: .init(repository: .random())
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
