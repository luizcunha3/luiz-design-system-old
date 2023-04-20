import UIKit

@available(iOS 10.0, *)
public extension NSLayoutConstraint {
    
    static func inset(view: UIView, inSuperview superView: UIView, withInset inset: UIEdgeInsets? = nil) -> [NSLayoutConstraint] {
        return [
            .top(firstView: superView, secondView: view, relation: .equal, constant: -(inset?.top ?? 0)),
            .left(firstView: superView, secondView: view, relation: .equal, constant: -(inset?.left ?? 0)),
            .right(firstView: superView, secondView: view, relation: .equal, constant: (inset?.right ?? 0)),
            .bottom(firstView: superView, secondView: view, relation: .equal, constant: (inset?.bottom ?? 0))
        ]
    }
    
    static func top(firstView: UIView,
                    secondView: UIView,
                    relation: NSLayoutConstraintType = .equal,
                    constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView,
                                  attribute: NSLayoutConstraint.Attribute.top,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: NSLayoutConstraint.Attribute.top,
                                  multiplier: 1,
                                  constant: CGFloat(constant))
    }
    
    static func left(firstView: UIView,
                     secondView: UIView,
                     relation: NSLayoutConstraintType = .equal,
                     constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView,
                                  attribute: NSLayoutConstraint.Attribute.left,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: NSLayoutConstraint.Attribute.left,
                                  multiplier: 1,
                                  constant: CGFloat(constant))
    }
    
    static func right(firstView: UIView,
                      secondView: UIView,
                      relation: NSLayoutConstraintType = .equal,
                      constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView,
                                  attribute: NSLayoutConstraint.Attribute.right,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: NSLayoutConstraint.Attribute.right,
                                  multiplier: 1,
                                  constant: CGFloat(constant))
    }
    
    static func bottom(firstView: UIView,
                       secondView: UIView,
                       relation: NSLayoutConstraintType = .equal,
                       constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView,
                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                  multiplier: 1,
                                  constant: CGFloat(constant))
    }
    
    static func baseLine(firstView: UIView,
                         secondView: UIView,
                         relation: NSLayoutConstraintType = .equal,
                         constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView,
                                  attribute: NSLayoutConstraint.Attribute.firstBaseline,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: NSLayoutConstraint.Attribute.firstBaseline,
                                  multiplier: 1,
                                  constant: CGFloat(constant))
    }
    
    static func over(topItem: UIView,
                     bottomItem: UIView,
                     relation: NSLayoutConstraintType = .equal,
                     constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: topItem,
                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                  relatedBy: relation.get(),
                                  toItem: bottomItem,
                                  attribute: NSLayoutConstraint.Attribute.top,
                                  multiplier: 1,
                                  constant: -1 * CGFloat(constant))
    }
    
    static func aside(left: UIView,
                      right: UIView,
                      relation: NSLayoutConstraintType = .equal,
                      constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: left,
                                  attribute: NSLayoutConstraint.Attribute.right,
                                  relatedBy: relation.get(),
                                  toItem: right,
                                  attribute: NSLayoutConstraint.Attribute.right,
                                  multiplier: 1,
                                  constant: -1 * CGFloat(constant))
    }
    
    static func height(view: UIView,
                       relation: NSLayoutConstraintType = .equal,
                       constant: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutConstraint.Attribute.height,
                                  relatedBy: relation.get(),
                                  toItem: nil,
                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                  multiplier: 1,
                                  constant: CGFloat(constant))
    }
    
    static func height(firstView: UIView,
                       secondView: UIView,
                       relation: NSLayoutConstraintType = .equal,
                       constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView,
                                  attribute: NSLayoutConstraint.Attribute.height,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: NSLayoutConstraint.Attribute.height,
                                  multiplier: 1,
                                  constant: CGFloat(constant))
    }
    
    static func height(firstView: UIView,
                       relation: NSLayoutConstraintType = .equal,
                       constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView,
                                  attribute: NSLayoutConstraint.Attribute.height,
                                  relatedBy: relation.get(),
                                  toItem: nil,
                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                  multiplier: 1,
                                  constant: CGFloat(constant))
    }
    
    static func width(firstView: UIView,
                      secondView: UIView,
                      relation: NSLayoutConstraintType = .equal,
                      constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView,
                                  attribute: NSLayoutConstraint.Attribute.width,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: NSLayoutConstraint.Attribute.width,
                                  multiplier: 1,
                                  constant: CGFloat(constant))
    }
    
    static func width(view: UIView,
                      relation: NSLayoutConstraintType = .equal,
                      constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutConstraint.Attribute.width,
                                  relatedBy: relation.get(),
                                  toItem: nil,
                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                  multiplier: 1,
                                  constant: CGFloat(constant))
    }
    
    static func centerX(firstView: UIView,
                        secondView: UIView,
                        relation: NSLayoutConstraintType = .equal,
                        constant: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView,
                                  attribute: NSLayoutConstraint.Attribute.centerX,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: NSLayoutConstraint.Attribute.centerX,
                                  multiplier: 1,
                                  constant: CGFloat(constant))
    }
    
    static func centerY(firstView: UIView,
                        secondView: UIView,
                        attribute: NSLayoutConstraint.Attribute = .centerY
                        relation: NSLayoutConstraintType = .equal,
                        constant: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView,
                                  attribute: NSLayoutConstraint.Attribute.centerY,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: attribute,
                                  multiplier: 1,
                                  constant: CGFloat(constant))
    }
    
    func isSimilar(to constraint: NSLayoutConstraint) -> Bool {
        return constraint.priority == priority &&
        constraint.relation == relation &&
        constraint.multiplier == multiplier &&
        constraint.firstItem as? UIView == firstItem as? UIView &&
        constraint.secondItem as? UIView == secondItem as? UIView &&
        constraint.firstAttribute == firstAttribute &&
        constraint.secondAttribute == secondAttribute &&
        constraint.firstAnchor == firstAnchor &&
        constraint.secondAnchor == secondAnchor
    }
    
}
