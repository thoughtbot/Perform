import UIKit
import Foundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window!.rootViewController = UIViewController()
    window!.makeKeyAndVisible()

    return false
  }
}

#if !swift(>=4.2)
extension UIApplication {
  typealias LaunchOptionsKey = UIApplicationLaunchOptionsKey
}
#endif
