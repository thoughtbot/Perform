import ReactiveCocoa
import Result
import UIKit

extension UIViewController {
  public static let perform: SignalProducer<String, NoError> = .init(value: "Hello, Perform")
}
