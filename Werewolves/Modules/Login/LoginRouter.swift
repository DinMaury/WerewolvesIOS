//
//  LoginRouter.swift
//  Werewolves
//
//  Created by Maury on 8/08/22.
//

import UIKit

protocol LoginRouterProtocol {
    func showLogin(presenter: LoginPresenterProtocol) -> LoginViewController
    func showGame()
}


final class LoginRouter {
    
    //MARK: - Properties
    private weak var viewController: UIViewController?
    
}

// MARK: - LoginRouterProtocol
extension LoginRouter: LoginRouterProtocol {

    func showLogin(presenter: LoginPresenterProtocol) -> LoginViewController {
        
        let viewController = LoginViewController(presenter)
        
        self.viewController = viewController
        
        return viewController
    }
    
    func showGame(){
        DispatchQueue.main.async {
            guard let navigationController = self.viewController?.navigationController else { return }
            
            let module = HomeGameModule()
            //navigationController.pushViewController(HomeGameViewController(), animated: false)
            module.show(in: navigationController)
        }
    }
}
