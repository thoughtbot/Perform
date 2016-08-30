import UIKit

extension UIViewController {
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
