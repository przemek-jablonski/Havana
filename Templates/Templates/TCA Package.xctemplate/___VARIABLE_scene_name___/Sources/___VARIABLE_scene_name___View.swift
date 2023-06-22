import ComposableArchitecture
import SwiftUI

public struct ___VARIABLE_scene_name___View {
  public let store: StoreOf<___VARIABLE_scene_name___Reducer>

  public init(
    _ store: StoreOf<___VARIABLE_scene_name___Reducer>
  ) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(store) { _ in
      Text("___VARIABLE_scene_name___")
        .font(.title)
    }
  }
}

#if DEBUG
public struct ___VARIABLE_scene_name___ViewPreviews: PreviewProvider {
  /// Primary preview for `___VARIABLE_scene_name___View`, shared with standalone preview app as well.
  public static var preview: some View {
    ___VARIABLE_scene_name___View(
      Store(
        initialState: ___VARIABLE_scene_name___Reducer.State(),
        reducer: ___VARIABLE_scene_name___Reducer()._printChanges()
      )
    )
  }

  public static var previews: some View {
    preview
  }
}
#endif
