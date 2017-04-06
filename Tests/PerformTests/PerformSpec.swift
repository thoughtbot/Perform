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
    let storyboard = UIStoryboard(name: "Main", bundle: nil)

    describe("perform") {
      var root: UIViewController?

      beforeEach {
        let nav = storyboard.instantiateInitialViewController() as? UINavigationController
        root = nav?.topViewController
      }

      afterEach {
        root = nil
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

      it("searches for a child view controller of matching view controller type") {
        var form: Form?

        root?.perform(.showModalForm) {
          form = $0
        }

        expect(form).to(beAKindOf(Form.self))
      }

      it("has a default prepare block") {
        root?.perform(.showDetail)
        expect(root?.navigationController?.topViewController).toEventually(beAKindOf(Detail.self))
      }
    }

    describe("configureViewControllers") {
      var controller: UITabBarController?

      beforeEach {
        controller = storyboard.instantiateViewController(withIdentifier: "Tabs") as? UITabBarController
      }

      afterEach {
        controller = nil
      }

      it("configures each tab in turn") {
        var configured: [String] = []

        controller?.configureViewControllers { viewController in
          switch viewController {
          case is Feed:
            configured.append("Feed")

          case is Profile:
            configured.append("Profile")

          default:
            break
          }
        }

        expect(configured).to(equal(["Feed", "Profile"]))
      }
    }
  }
}
