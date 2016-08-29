@testable import PerformHarness
import Perform
import UIKit
import Quick
import Nimble

extension Segue {
  static var showDetail: Segue { return .init(identifier: "ShowDetail") }
}

final class PerformSpec: QuickSpec {
  override func spec() {
    describe("perform") {
      it("passes the destination view controller to the completion block") {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nav = storyboard.instantiateInitialViewController() as? UINavigationController
        let root = nav?.topViewController

        var detail: UIViewController?

        root?.perform(.showDetail) {
          detail = $0
        }

        expect(detail).to(beAKindOf(UIViewController.self))
      }
    }
  }
}
