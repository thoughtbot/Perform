import ReactiveCocoa
import enum Result.NoError

extension SignalType {
  func assumeNoError() -> Signal<Value, NoError> {
    return mapError { _ in
      fatalError()
      ()
    }
  }
}
