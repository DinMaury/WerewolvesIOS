//
//  LoginModule.swift
//  Werewolves
//
//  Created by Maury on 8/08/22.
//

import Foundation

final class LoginModule {
    
    private let presenter: LoginPresenterProtocol
    
    init() {
    
        presenter = LoginPresenter(router: LoginRouter(), interactor: LoginInteractor())
    }
}

extension LoginModule {
    
    func showLogin() -> LoginViewController {
        
        presenter.showLogin()
    }
}
