import UIKit

@available(iOS 11.0, *)
public class DSConstraint {
    let view: UIView
    private var updatingMode = false
    
    public var width: NSLayoutDimension {
        return view.widthAnchor
    }
    
    public var height: NSLayoutDimension {
        return view.heightAnchor
    }
    
    init(view: UIView) {
        self.view = view
    }
    
    public func applyConstraint(_ block: ((DSConstraint) -> Void)) {
        view.translatesAutoresizingMaskIntoConstraints = false
        block(self)
    }
    
    public func edges(in superView: UIView,
                      with offSet: UIEdgeInsets? = nil) {
        let constraints = NSLayoutConstraint.inset(view: self.view, inSuperview: superView, withInset: offSet)
        constraints.activate()
    }
    
    public func edges(in superView: UIView,
                      offSet: CGFloat,
                      priority: UILayoutPriority = .required) {
        let inset = UIEdgeInsets(top: offSet, left: offSet, bottom: offSet, right: offSet)
        let constraints = NSLayoutConstraint.inset(view: self.view, inSuperview: superView, withInset: inset)
        constraints.forEach {$0.priority = priority}
        constraints.activate()
    }
    
    public func sides(with superView: UIView,
                      offSet: CGFloat = 0,
                      priority: UILayoutPriority = .required) {
        left(alignedWith: superView, offSet: offSet, priority: priority)
        right(alignedWith: superView, offSet: offSet, priority: priority)
    }
    
    @discardableResult
    public func top(alignedWith view: UIView,
                    relation: NSLayoutConstraintType = .equal,
                    offSet: CGFloat = 0,
                    priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.top(firstView: self.view, secondView: view, relation: relation, constant: offSet)
        constraint.priority = priority
        return updatedConstraintIfNeeded(constraint: constraint, offSet: CGFloat(offSet))
    }
    
    @discardableResult
    public func topSafeArea(alignedWith: UIView,
                            relation: NSLayoutConstraintType = .equal,
                            offSet: CGFloat = 0,
                            priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.view.topAnchor.constraint(equalTo: alignedWith.safeAreaLayoutGuide.topAnchor,
                                                        constant: offSet)
        constraint.priority = priority
        return updatedConstraintIfNeeded(constraint: constraint, offSet: offSet)
    }
    
    @discardableResult
    public func left(alignedWith view: UIView,
                     relation: NSLayoutConstraintType = .equal,
                     offSet: CGFloat = 0,
                     priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.left(firstView: self.view, secondView: view, relation: relation, constant: offSet)
        constraint.priority = priority
        return updatedConstraintIfNeeded(constraint: constraint, offSet: CGFloat(offSet))
    }
    
    @discardableResult
    public func left(of view: UIView,
                     relation: NSLayoutConstraintType = .equal,
                     offSet: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.aside(left: self.view,
                                                  right: view,
                                                  relation: relation,
                                                  constant: offSet)
        return updatedConstraintIfNeeded(constraint: constraint, offSet: CGFloat(offSet))
    }
    
    @discardableResult
    public func left(alignedWith: UILayoutGuide,
                     relation: NSLayoutConstraintType = .equal,
                     offSet: CGFloat = 0) -> NSLayoutConstraint {
        
        let constraint = self.view.leftAnchor.constraint(equalTo: alignedWith.leftAnchor,
                                                         constant: offSet)
        return updatedConstraintIfNeeded(constraint: constraint, offSet: offSet)
    }
    
    @discardableResult
    public func leftSafeArea(alignedWith: UIView,
                             relation: NSLayoutConstraintType = .equal,
                             offSet: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = self.view.leftAnchor.constraint(equalTo: alignedWith.safeAreaLayoutGuide.leftAnchor, constant: offSet)
        return updatedConstraintIfNeeded(constraint: constraint, offSet: offSet)
    }
    
    @discardableResult
    public func right(alignedWith: UIView,
                      relation: NSLayoutConstraintType = .equal,
                      offSet: CGFloat = 0,
                      priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.right(firstView: self.view,
                                                  secondView: alignedWith,
                                                  relation: relation,
                                                  constant: -offSet)
        constraint.priority = priority
        return updatedConstraintIfNeeded(constraint: constraint, offSet: -CGFloat(offSet))
    }
    
    @discardableResult
    public func right(of view: UIView,
                      relation: NSLayoutConstraintType = .equal,
                      offSet: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.aside(left: view, right: self.view, relation: relation, constant: offSet)
        return updatedConstraintIfNeeded(constraint: constraint, offSet: CGFloat(offSet))
    }
    
    @discardableResult
    public func right(alignedWith: UILayoutGuide,
                      relation: NSLayoutConstraintType = .equal,
                      offSet: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = self.view.rightAnchor.constraint(equalTo: alignedWith.rightAnchor, constant: offSet)
        return updatedConstraintIfNeeded(constraint: constraint, offSet: offSet)
    }
    
    @discardableResult
    public func rightSafeArea(alignedWith: UIView,
                              relation: NSLayoutConstraintType = .equal,
                              offSet: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = self.view.rightAnchor.constraint(equalTo: alignedWith.safeAreaLayoutGuide.rightAnchor, constant: -offSet)
        return updatedConstraintIfNeeded(constraint: constraint, offSet: -offSet)
    }
    
    public func edgesSafeArea(alignedWith view: UIView) {
        rightSafeArea(alignedWith: view)
        bottomSafeArea(alignedWith: view)
    }
    
    @discardableResult
    public func under(view: UIView,
                      relation: NSLayoutConstraintType = .equal,
                      offSet: CGFloat = 0,
                      priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.over(topItem: view,
                                                 bottomItem: self.view,
                                                 relation: relation,
                                                 constant: offSet)
        constraint.priority = priority
        return updatedConstraintIfNeeded(constraint: constraint, offSet: offSet)
    }
    
    
    
    @discardableResult
    public func bottom(alignedWith: UIView,
                       relation: NSLayoutConstraintType = .equal,
                       offSet: CGFloat = 0,
                       priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.bottom(firstView: self.view,
                                                   secondView: alignedWith,
                                                   relation: relation,
                                                   constant: -offSet)
        constraint.priority = priority
        return updatedConstraintIfNeeded(constraint: constraint, offSet: -CGFloat(offSet))
    }
    
    @discardableResult
    public func bottomSafeArea(alignedWith: UIView,
                               relation: NSLayoutConstraintType = .equal,
                               offSet: CGFloat = 0,
                               priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.view.bottomAnchor.constraint(equalTo: alignedWith.safeAreaLayoutGuide.bottomAnchor, constant: -offSet)
        return updatedConstraintIfNeeded(constraint: constraint, offSet: -offSet)
    }
    
    @discardableResult
    public func above(view: UIView,
                      relation: NSLayoutConstraintType = .equal,
                      offSet: CGFloat = 0,
                      priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.over(topItem: self.view, bottomItem: view, relation: relation, constant: offSet)
        return updatedConstraintIfNeeded(constraint: constraint, offSet: CGFloat(offSet))
    }
    
    @discardableResult
    public func width(relation: NSLayoutConstraintType = .equal,
                       priority: UILayoutPriority = .required,
                       _ size: CGFloat) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.width(view: self.view,
                                                   relation: relation,
                                                   constant: size)
        constraint.priority = priority
        return updatedConstraintIfNeeded(constraint: constraint, offSet: CGFloat(size))
    }
    
    @discardableResult
    public func height(relation: NSLayoutConstraintType = .equal,
                       priority: UILayoutPriority = .required,
                       _ size: CGFloat) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.height(view: self.view,
                                                   relation: relation,
                                                   constant: size)
        constraint.priority = priority
        return updatedConstraintIfNeeded(constraint: constraint, offSet: CGFloat(size))
    }
    
    @discardableResult
    public func verticalCenter(view: UIView,
                               relation: NSLayoutConstraintType = .equal,
                               attribute: NSLayoutConstraint.Attribute = .centerY,
                               offSet: CGFloat = 0) -> NSLayoutConstraint {
        
    }
    
    private func updatedConstraintIfNeeded(constraint: NSLayoutConstraint, offSet: CGFloat) -> NSLayoutConstraint {
        if updatingMode, let similarConstraint = getSimilarConstraint(to: constraint) {
            similarConstraint.constant = offSet
            return similarConstraint
        }
        constraint.isActive = true
        return constraint
    }
    
    private func getSimilarConstraint(to constraint: NSLayoutConstraint) -> NSLayoutConstraint? {
        if let similarConstraint = view.constraints.first(where: {$0.isSimilar(to: constraint)}){
            return similarConstraint
        }
        return view.superview?.constraints.first { $0.isSimilar(to: constraint)}
    }
    
}

