import UIKit

@available(iOS 11.0, *)
public extension UIView {
    var ds: DSConstraint {
        return DSConstraint(view: self)
    }
}
