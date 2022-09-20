//
//  File.swift
//  
//
//  Created by Luiz Cunha on 20/09/22.
//

import UIKit

public enum NavigationType: Equatable {
    case root
    case rootTransition(duration: TimeInterval)
    case push
    case present
}

public protocol Coordinator {
    var currentViewController: UIViewController? { get }
    var navigationController: UINavigationController { get }
    func start(with navigationType: NavigationType)
}

public extension Coordinator {
    func show(_ viewControllers: [UIViewController],
              animated: Bool = true) {
        let currentViewControllers = navigationController.viewControllers
        navigationController.setViewControllers(currentViewControllers + viewControllers, animated: animated)
    }
    
    func show(_ viewController: UIViewController,
              with navigationType: NavigationType,
              animated: Bool = true) {
        switch navigationType {
        case .root:
            showRoot(viewController)
        case .rootTransition(let duration):
            showRoot(with: duration, viewController)
        case .push:
            navigationController.pushViewController(viewController, animated: animated)
        case .present:
            if !(viewController.modalPresentationStyle == .custom || viewController.modalPresentationStyle == .overFullScreen) {
                viewController.modalPresentationStyle = .fullScreen
            }
            navigationController.present(viewController, animated: animated)
        }
    }
    private func showRoot(with duration: TimeInterval = 0.3, _ viewController: UIViewController) {
        let transition = CATransition()
        transition.duration = duration
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = .fade
        navigationController.view.layer.add(transition, forKey: nil)
        navigationController.setViewControllers([viewController], animated: false)
        navigationController.dismiss(animated: false, completion: nil)
    }
    
    func dismiss(_ viewController: UIViewController, animated: Bool = true) {
        viewController.dismiss(animated: animated, completion: nil)
    }
    
    func back(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }
    
}
