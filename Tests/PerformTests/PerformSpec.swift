@testable import PerformHarness
import Perform
import UIKit
import Quick
import Nimble

extension Segue {
  static var showDetail: Segue { return .init(identifier: "ShowDetail") }
  static var showDetailCast: Segue<Detail> { return .init(identifier: "ShowDetail") }
  static var showModalForm: Segue<Form> { return .init(identifier: "ShowForm") }
}

final class PerformSpec: QuickSpec {
  override func spec() {
    describe("perform") {
      var root: UIViewController?

      beforeEach {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nav = storyboard.instantiateInitialViewController() as? UINavigationController
        root = nav?.topViewController
      }

      it("passes the destination view controller to the completion block") {
        var detail: UIViewController?

        root?.perform(.showDetail) {
          detail = $0
        }

        expect(detail).to(beAKindOf(UIViewController.self))
      }

      it("casts the destination view controller to the specific view controller type") {
        var detail: Detail?

        root?.perform(.showDetailCast) {
          detail = $0
        }

        expect(detail).to(beAKindOf(Detail.self))
      }
    }
  }
}
