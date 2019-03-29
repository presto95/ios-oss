@testable import Kickstarter_Framework
import XCTest

final class CheckoutViewControllerTests: XCTestCase {
  func testViewDidLoadAddsChildTableViewController() {
    let vc = CheckoutViewController.instantiate()
    _ = vc.view

    XCTAssertTrue(vc.children.first is CheckoutTableViewController)
  }
}
