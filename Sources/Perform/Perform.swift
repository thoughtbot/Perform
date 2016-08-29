import ReactiveCocoa
import Result
import UIKit

extension UIViewController {
  public func perform(segue: Segue, configure: (UIViewController) -> Void) {
    performSegue(withIdentifier: segue.identifier).startWithNext { segue, _ in
      configure(segue.destinationViewController)
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
