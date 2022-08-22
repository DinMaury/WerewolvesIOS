//
//  HomePresenter.swift
//  Werewolves
//
//  Created by Maury on 8/08/22.
//

import Foundation

//MARK: - protocol
protocol HomePresenterProtocol {
    
    var dataSource: HomeDataSource { get }
    var delegate: HomePresenterDelegate? { get set }
    
    func showLogin() -> HomeViewController
    func login(email: String, password: String)
    
}

//MARK: - Delegate
protocol HomePresenterDelegate: AnyObject {
    func errorToLogin()
}

//MARK: Presenter
final class HomePresenter {
    
    //MARK: - Properties
    private let router: HomeRouterProtocol
    private let interactor: HomeInteractorProtocol
    
    var dataSource = HomeDataSource()
    
    weak var delegate: HomePresenterDelegate?
    
    //MARK: - Inits
    init(router: HomeRouterProtocol, interactor: HomeInteractorProtocol) {
        self.router = router
        self.interactor = interactor
        
        setupDataSource()
    }
}

// MARK: - HomePresenterProtocol
extension HomePresenter: HomePresenterProtocol {
    
    func showLogin() -> HomeViewController {
        
        let defaults = UserDefaults.standard
        if let email = defaults.value(forKey: "email") as? String {
            
            //View existing login
            return router.showLogin(presenter: self)
        } else {
            return router.showLogin(presenter: self)
        }
    }
    
    func login(email: String, password: String) {
        interactor.login(email: email, password: password) { [weak self] error in
            if error == nil {
                
            } else {
                self?.delegate?.errorToLogin()
            }
        }

    }
    
}

//MARK: - Private
private extension HomePresenter {
    
    func setupDataSource() {
        
        //dataSource.func = {        }
    }
}
