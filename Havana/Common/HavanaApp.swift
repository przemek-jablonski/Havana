import SwiftUI

@main
struct HavanaApp: App {
  @UIApplicationDelegateAdaptor(HavanaiOSAppDelegate.self) var appDelegate
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
