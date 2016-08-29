import ReactiveCocoa
import Result
import UIKit

extension UIViewController {
  public func perform<Destination: UIViewController>(segue: Segue<Destination>, configure: (Destination) -> Void) {
    performSegue(withIdentifier: segue.identifier).startWithNext { segue, _ in
      guard let destination = segue.destinationViewController(ofType: Destination.self) else {
        let printHierarchy = "_printHierarchy"
        let hierarchy = segue.destinationViewController.performSelector(Selector(printHierarchy)).takeUnretainedValue()
        fatalError("expected destination view controller hierarchy to include \(Destination.self), got:\n\(hierarchy)")
      }
      configure(destination)
    }
  }

  @warn_unused_result(message="Did you forget to call 'start' on the producer?")
  internal func performSegue(withIdentifier identifier: String, sender: AnyObject? = nil) -> SignalProducer<(UIStoryboardSegue, AnyObject?), NoError> {
    return SignalProducer { observer, disposable in
      disposable += self.rac_producer(for: #selector(UIViewController.prepareForSegue(_:sender:)))
        .assumeNoError()
        .map { ($0.first as! UIStoryboardSegue, $0.second) }
        .take(1)
        .start(observer)

      self.performSegueWithIdentifier(identifier, sender: sender)
    }
  }
}

// MARK: - Type checker ambiguity hack

extension UIViewController {
  @available(*, unavailable)
  public func perform() {
    fatalError(
      "This method will never be called, and exists only to remove an " +
      "apparent ambiguity resolving the generic method 'perform(_:configure:)'"
    )
  }
}
