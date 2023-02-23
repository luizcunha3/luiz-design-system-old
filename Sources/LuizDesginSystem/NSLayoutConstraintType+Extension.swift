import UIKit

public enum NSLayoutConstraintType {
    case equal
    case greaterThanOrEqual
    case lessThanOrEqual

    func get() -> NSLayoutConstraint.Relation {
        switch self {
        case .equal:
            return NSLayoutConstraint.Relation.equal
        case .greaterThanOrEqual:
            return NSLayoutConstraint.Relation.greaterThanOrEqual
        case .lessThanOrEqual:
            return NSLayoutConstraint.Relation.lessThanOrEqual
        }
    }
}
