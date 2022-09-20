//
//  File.swift
//  
//
//  Created by Luiz Cunha on 20/09/22.
//

import Foundation
import UIKit

public final class AppCoordinator {
    private(set) var parentViewController: ParentViewController
    var navigationController: UINavigationController = UINavigationController()
    weak var window: UIWindow?
    var currentCoordinator: Coordinator?
    
    init(window: UIWindow) {
        let controller = ParentViewController(child: navigationController)
        self.parentViewController = controller
        window.rootViewController = parentViewController
        window.makeKeyAndVisible()
    }
    
    func start(coordinator: Coordinator) {
        currentCoordinator = coordinator
        coordinator.start(with: .root)
    }
}
