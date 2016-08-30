import UIKit

extension UIViewController {
  public func perform<Destination: UIViewController>(segue: Segue<Destination>, configure: (Destination) -> Void) {
    performSegue(withIdentifier: segue.identifier) { segue, _ in
      guard let destination = segue.destinationViewController(ofType: Destination.self) else {
        let printHierarchy = "_printHierarchy"
        let hierarchy = segue.destinationViewController.performSelector(Selector(printHierarchy)).takeUnretainedValue()
        fatalError("expected destination view controller hierarchy to include \(Destination.self), got:\n\(hierarchy)")
      }
      configure(destination)
    }
  }

  internal func performSegue(withIdentifier identifier: String, sender: AnyObject? = nil, configure: (UIStoryboardSegue, AnyObject?) -> Void) {
    try! aspect_hook(
      #selector(UIViewController.prepareForSegue(_:sender:)),
      options: [.PositionAfter, .OptionAutomaticRemoval],
      body: { info in
        let arguments = info.arguments()
        configure(arguments.first as! UIStoryboardSegue, arguments.second)
      }
    )

    performSegueWithIdentifier(identifier, sender: sender)
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
