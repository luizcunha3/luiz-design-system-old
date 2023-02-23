
import UIKit
import LuizDesginSystem

class AppCoordinator {
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
    
    func start() {
        
    }
}
