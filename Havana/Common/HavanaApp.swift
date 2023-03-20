import ComposableArchitecture
import SwiftUI

@main
struct HavanaApp: App {
  @UIApplicationDelegateAdaptor(HavanaiOSAppDelegate.self) var appDelegate

  var body: some Scene {
    WindowGroup {
      HavanaRootView(
        store: Store(
          // TODO: how does this struct know if to present login or not
          initialState: Havana.State.login(.loginFlowSelection),
          reducer: Havana()
        )
      )
    }
  }
}
