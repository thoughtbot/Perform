import UIKit

extension UIStoryboardSegue {
  @nonobjc
  public final func destinationViewController<Destination: UIViewController>(ofType type: Destination.Type) -> Destination? {
    var queue: [UIViewController] = [destinationViewController]

    while let viewController = queue.popLast() {
      queue.insertContentsOf(viewController.childViewControllers, at: 0)

      if let destination = viewController as? Destination {
        return destination
      }
    }

    return nil
  }
}
