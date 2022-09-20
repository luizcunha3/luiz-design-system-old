//
//  File.swift
//  
//
//  Created by Luiz Cunha on 20/09/22.
//

import UIKit

final public class ParentViewController: UIViewController {
    let childViewController: UIViewController
    
    public init(child: UIViewController) {
        self.childViewController = child
        super.init(nibName: nil, bundle: nil)
        load()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func load() {
        addChild(childViewController)
        view.addSubview(childViewController.view)
        childViewController.didMove(toParent: self)
    }
}
