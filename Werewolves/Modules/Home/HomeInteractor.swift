//
//  HomeInteractor.swift
//  Werewolves
//
//  Created by Maury on 8/08/22.
//

import Foundation

protocol HomeInteractorProtocol {
    func login(email: String, password: String, completionError: @escaping ((Error?) -> Void))
}


final class HomeInteractor {
    
    private let manager: AuthManagerProtocol
    
    init() {
        manager = AuthManager()
    }
}

// MARK: - HomeInteractorProtocol
extension HomeInteractor: HomeInteractorProtocol {
    
    func login(email: String, password: String, completionError: @escaping ((Error?) -> Void)) {
        manager.login(email: email, password: password, completionError: completionError)
    }
    
}
