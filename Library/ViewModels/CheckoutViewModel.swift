import KsApi
import Foundation
import Prelude
import ReactiveSwift
import Result

public protocol CheckoutViewModelInputs {
  func configure(with project: Project)
}

public protocol CheckoutViewModelOutputs {

}

public protocol CheckoutViewModelType {
  var inputs: CheckoutViewModelInputs { get }
  var outputs: CheckoutViewModelOutputs { get }
}

public class CheckoutViewModel: CheckoutViewModelType, CheckoutViewModelInputs, CheckoutViewModelOutputs {
  public init() {
    self.configureProjectProperty.signal
      .skipNil()
      .observeValues { project in
        print("*** :\(project.name)")
    }
  }

  private let configureProjectProperty = MutableProperty<Project?>(nil)
  public func configure(with project: Project) {
    self.configureProjectProperty.value = project
  }

  public var inputs: CheckoutViewModelInputs { return self }
  public var outputs: CheckoutViewModelOutputs { return self }
}
