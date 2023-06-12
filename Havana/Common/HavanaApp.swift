import ComposableArchitecture
import SwiftUI

@main
internal struct HavanaApp: App {
  #if canImport(UIKit)
  @UIApplicationDelegateAdaptor(HavanaiOSAppDelegate.self)
  private var appDelegate
  #endif

  internal var body: some Scene {
    WindowGroup {
      HavanaAppView()
    }
  }
}
