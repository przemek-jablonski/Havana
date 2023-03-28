import ComposableArchitecture
import Composables
import SwiftUI

public struct UserContextView: ComposableView {
  public let store: StoreOf<UserContextReducer>

  public init(
    _ store: StoreOf<UserContextReducer>
  ) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(self.store) { _ in
      Text("UserContext")
        .font(.title)
    }
  }
}

internal struct UserContextViewPreviews: PreviewProvider {
  internal static var previews: some View {
    UserContextView(
      Store(
        initialState: UserContextReducer.State(),
        reducer: UserContextReducer()
      )
    )
  }
}
