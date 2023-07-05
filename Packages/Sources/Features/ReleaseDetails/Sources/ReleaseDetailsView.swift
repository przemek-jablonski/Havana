import ComposableArchitecture
import SwiftUI

public struct ReleaseDetailsView: View {
  public let store: StoreOf<ReleaseDetailsReducer>

  public init(
    _ store: StoreOf<ReleaseDetailsReducer>
  ) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(store) { viewStore in
      List {
        if let body = viewStore.release.body {
          Text(body)
        }

        Text(viewStore.release.htmlUrl)

        Text(String(describing: viewStore.release))
      }
    }
  }
}

#if DEBUG
public struct ReleaseDetailsViewPreviews: PreviewProvider {
  /// Primary preview for `ReleaseDetailsView`, shared with standalone preview app as well.
  public static var preview: some View {
    ReleaseDetailsView(
      Store(
        initialState: ReleaseDetailsReducer.State(
          release: .random()
        )
      ) {
        ReleaseDetailsReducer()
          ._printChanges()
      }
    )
  }

  public static var previews: some View {
    preview
  }
}
#endif
