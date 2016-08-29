import ReactiveCocoa
import enum Result.NoError

extension SignalProducerType {
  func assumeNoError() -> SignalProducer<Value, NoError> {
    return lift { $0.assumeNoError() }
  }
}
