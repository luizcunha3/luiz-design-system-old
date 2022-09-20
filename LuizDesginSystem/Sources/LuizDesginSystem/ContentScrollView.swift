
//
//  File.swift
//  
//
//  Created by Luiz Cunha on 01/09/22.
//

import UIKit

@available(iOS 11.0, *)
public class ContentScrollView: UIView {
    let scrollview = UIScrollView()
    public let contentView = UIView()
    let inset: UIEdgeInsets?
    public init(inset: UIEdgeInsets? = nil) {
        self.inset = inset
        super.init(frame: .zero)
        buildView()
        setConstraints()
    }
    
    private func buildView() {
        scrollview.addSubview(contentView)
        self.addSubview(scrollview)
    }
    
    private func setConstraints() {
        scrollview.ds.applyConstraint {
            $0.topSafeArea(alignedWith: self)
            $0.left(alignedWith: self)
            $0.right(alignedWith: self)
            $0.bottom(alignedWith: self)
        }
        let topInset = inset?.top ?? 0
        let leftInset = inset?.left ?? 0
        let rightInset = inset?.right ?? 0
        let bottomInset = inset?.bottom ?? 0
        contentView.ds.applyConstraint {
            $0.top(alignedWith: scrollview, offSet: topInset)
            $0.left(alignedWith: self, offSet: leftInset)
            $0.right(alignedWith: self, offSet: rightInset)
            $0.bottomSafeArea(alignedWith: scrollview, offSet: bottomInset)
        }
    }
    
    public func addContent(_ view: UIView) {
        contentView.addSubview(view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
