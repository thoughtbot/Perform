import UIKit

extension UITabBarController {
  public func configureViewControllers(@noescape configure: (UIViewController) -> Void) {
    let hierarchy = (viewControllers ?? []).lazy.flatMap { $0.hierarchy }
    hierarchy.forEach(configure)
  }
}
