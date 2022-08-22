//
//  HomeRouter.swift
//  Werewolves
//
//  Created by Maury on 8/08/22.
//

import UIKit

protocol HomeRouterProtocol {
    func showLogin(presenter: HomePresenterProtocol) -> HomeViewController
    func showGame()
}


final class HomeRouter {
    
    //MARK: - Properties
    private weak var viewControllr: UIViewController?
    
}

// MARK: - HomeRouterProtocol
extension HomeRouter: HomeRouterProtocol {

    func showLogin(presenter: HomePresenterProtocol) -> HomeViewController {
        
        let viewController = HomeViewController(presenter)
        
        self.viewControllr = viewController
        
        return viewController
    }
    
    func showGame(){
        
        guard let navigationController = viewControllr?.navigationController else { return }
        
        navigationController.pushViewController(HomeGameViewController(), animated: false)
    }
}
