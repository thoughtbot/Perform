import UIKit

extension UIViewController {
  public func childViewController<Child: UIViewController>(ofType type: Child.Type) -> Child? {
    return hierarchy.first { $0 as? Child }
  }

  var hierarchy: AnySequence<UIViewController> {
    return AnySequence { () -> AnyGenerator<UIViewController> in
      var queue = [self]

      return AnyGenerator {
        if let next = queue.popLast() {
          queue.insertContentsOf(next.childViewControllers, at: 0)
          return next
        } else {
          return nil
        }
      }
    }
  }
}
