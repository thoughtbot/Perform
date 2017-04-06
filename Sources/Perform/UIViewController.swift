import UIKit

extension UIViewController {
  /// Perform a breadth-first search of the receiver's view controller hierarchy,
  /// returning the first view controller matching the given `type`, or nil.
  ///
  /// - parameter type:
  ///     The type of the view controller to search for.
  ///
  /// - returns:
  ///     The first view controller matching the given `type`, or nil.
  public func childViewController<Child: UIViewController>(ofType type: Child.Type) -> Child? {
    return hierarchy.first { $0 as? Child }
  }

  var hierarchy: AnySequence<UIViewController> {
    return AnySequence { () -> AnyIterator<UIViewController> in
      var queue = [self]

      return AnyIterator {
        if let next = queue.popLast() {
          queue.insert(contentsOf: next.childViewControllers, at: 0)
          return next
        } else {
          return nil
        }
      }
    }
  }
}
