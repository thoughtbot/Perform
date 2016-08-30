import UIKit

extension UITabBarController {
  public func configureTabs(@noescape configure: (UIViewController) -> Void) {
    let hierarchy = (viewControllers ?? []).lazy.flatMap { $0.hierarchy }
    hierarchy.forEach(configure)
  }
}
