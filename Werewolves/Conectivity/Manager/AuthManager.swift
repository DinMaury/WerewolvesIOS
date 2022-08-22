//
//  AuthManager.swift
//  Werewolves
//
//  Created by Maury on 9/08/22.
//

import Foundation
import FirebaseAuth

//MARK: - Protocol
protocol AuthManagerProtocol {
    
    func login(email: String, password: String, completionError: @escaping ((Error?) -> Void))
}

//MARK: - Manager
final class AuthManager {
    
}

//MARK: - AuthManagerProtocol
extension AuthManager: AuthManagerProtocol {
    
    func login(email: String, password: String, completionError: @escaping ((Error?) -> Void)) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error == nil {
                completionError(error)
            } else {
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    
                    completionError(error)
                }
            }
                
        }
    }
}
