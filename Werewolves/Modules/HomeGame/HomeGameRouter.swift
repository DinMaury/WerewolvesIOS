import UIKit

protocol HomeGameRouterProtocol {
    
    func show(presenter: HomeGamePresenterProtocol, in navigationController: UINavigationController)
}


final class HomeGameRouter {
    
    //MARK: - Properties
    private weak var viewController: UIViewController?
    
}

// MARK: - HomeGameRouterProtocol
extension HomeGameRouter: HomeGameRouterProtocol {
    
    func show(presenter: HomeGamePresenterProtocol, in navigationController: UINavigationController) {
        
        let viewController = HomeGameViewController(presenter)
        navigationController.pushViewController(viewController, animated: true)
        self.viewController = viewController
        
    }
}
