import KsApi
import Prelude
import UIKit

final class CheckoutViewController: UIViewController {
  // MARK: - Properties

  private lazy var checkoutTableViewController: CheckoutTableViewController = {
    CheckoutTableViewController.instantiate()
  }()

  // MARK: - Lifecycle

  static func instantiate() -> CheckoutViewController {
    return CheckoutViewController()
  }

  func configure(with project: Project) {
    self.checkoutTableViewController.configure(with: project)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    _ = self
      |> \.title %~ { _ in "Back this project" }

    if let childView = self.checkoutTableViewController.tableView {
      self.addChild(self.checkoutTableViewController)
      self.view.addSubview(childView)
      self.checkoutTableViewController.didMove(toParent: self)

      childView.constrainEdges(to: self.view)
    }
  }
}
