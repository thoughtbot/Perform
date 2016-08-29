import UIKit

public struct Segue<Destination: UIViewController> {
  public let identifier: String

  public init(identifier: String) {
    self.identifier = identifier
  }
}
