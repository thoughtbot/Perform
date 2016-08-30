import UIKit

extension UIStoryboardSegue {
  @nonobjc
  public final func destinationViewController<Destination: UIViewController>(ofType type: Destination.Type) -> Destination? {
    return destinationViewController.hierarchy.first { $0 as? Destination }
  }
}
