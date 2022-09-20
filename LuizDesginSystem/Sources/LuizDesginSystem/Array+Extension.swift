import UIKit

public extension Array where Element == NSLayoutConstraint {
    func activate() {
        NSLayoutConstraint.activate(self)
    }

    func deactivate() {
        NSLayoutConstraint.deactivate(self)
    }
}
