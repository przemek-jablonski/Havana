import ___VARIABLE_scene_name___Feature
import ComposableArchitecture
import SwiftUI

@main
internal struct ___VARIABLE_scene_name___Preview: App {
  internal var body: some Scene {
    WindowGroup {
      NavigationView {
        ___VARIABLE_scene_name___View(
          Store(
            initialState: ___VARIABLE_scene_name___Reducer.State(),
            reducer: ___VARIABLE_scene_name___Reducer()
          )
        )
        .navigationTitle("___VARIABLE_scene_name___ Preview")
      }
    }
  }
}
