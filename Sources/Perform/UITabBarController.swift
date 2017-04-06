import UIKit

extension UITabBarController {
  /// For each view controller in `viewControllers`, iterate over its view
  /// controller hierarchy, passing each view controller to `configure`.
  ///
  /// **Example**
  ///
  ///     class AppController: UITabBarController {
  ///       let taskList = TaskList.shared
  ///
  ///       override func viewDidLoad() {
  ///         super.viewDidLoad()
  ///
  ///         configureViewControllers { viewController in
  ///           if let tasks = viewController as? TasksViewController {
  ///             tasks.taskList = taskList
  ///           }
  ///         }
  ///       }
  ///     }
  ///
  /// - parameter configure:
  ///     A function that will be invoked once with each view controller
  ///     in each tab's view controller hierarchy.
  public func configureViewControllers(_ configure: (UIViewController) -> Void) {
    let hierarchy = (viewControllers ?? []).lazy.flatMap { $0.hierarchy }
    hierarchy.forEach(configure)
  }
}
