#if canImport(UIKit)
import Foundation
import UIKit

public class HavanaiOSAppDelegate: NSObject, UIApplicationDelegate {
  // swiftlint:disable discouraged_optional_collection
  public func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
    return true
  }
  // swiftlint:enable discouraged_optional_collection

  public func applicationWillResignActive(_ application: UIApplication) {

  }

  public func applicationDidEnterBackground(_ application: UIApplication) {

  }

  public func applicationWillTerminate(_ application: UIApplication) {

  }
}
#endif
