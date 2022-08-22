//
//  HomeModule.swift
//  Werewolves
//
//  Created by Maury on 8/08/22.
//

import Foundation

final class HomeModule {
    
    private let presenter: HomePresenterProtocol
    
    init() {
    
        presenter = HomePresenter(router: HomeRouter(), interactor: HomeInteractor())
    }
}

extension HomeModule {
    
    func showLogin() -> HomeViewController {
        
        presenter.showLogin()
    }
}
