import Foundation
import ReactiveCocoa

extension NSObject {
  func rac_producer(for selector: Selector) -> SignalProducer<RACTuple, NSError> {
    return rac_signalForSelector(selector)
      .toSignalProducer()
      .map { ($0 as! RACTuple) }
  }
}
