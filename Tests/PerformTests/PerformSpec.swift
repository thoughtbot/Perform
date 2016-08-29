@testable import Perform
import Quick
import Nimble
import ReactiveCocoa
import Result

final class PerformTests: QuickSpec {
  override func spec() {
    describe("Perform") {
      it("works") {
        expect(UIViewController.perform.first()?.value).to(equal("Hello, Perform"))
      }
    }
  }
}
