import ComposableArchitecture
import SwiftUI

@main
internal struct HavanaApp: App {
  @UIApplicationDelegateAdaptor(HavanaiOSAppDelegate.self) private var appDelegate

  internal var body: some Scene {
    WindowGroup {
      HavanaAppView()
    }
  }
}
