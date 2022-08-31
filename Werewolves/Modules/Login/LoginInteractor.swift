import Foundation
import ConnectivityFramework

typealias CompletionBlock = () -> Void
typealias CompletionStatusBlock = (LoginStatus) -> Void
typealias CompletionErrorBlock = (ErrorAPI) -> Void
protocol LoginInteractorProtocol {
    func login(email: String, password: String, completion: @escaping CompletionStatusBlock, onError: @escaping CompletionErrorBlock)
    func register(email: String, password: String, name: String, completion: @escaping CompletionBlock, onError: @escaping CompletionErrorBlock)
}


final class LoginInteractor {
    
    init() {
        
    }
}

// MARK: - LoginInteractorProtocol
extension LoginInteractor: LoginInteractorProtocol {
    
    func login(email: String, password: String, completion: @escaping CompletionStatusBlock, onError: @escaping CompletionErrorBlock) {
        Task {
            do {
                let status = try await LoginService.shared.login(email: email, password: password)
                switch status {
                    
                case .logged:
                    completion(status)
                    
                case .registerIsRequired:
                    completion(status)
                }
            } catch {
                onError(error as? ErrorAPI ?? ErrorAPI.unknown)
            }
        }
    }
    
    func register(email: String, password: String, name: String, completion: @escaping CompletionBlock, onError: @escaping CompletionErrorBlock) {
        Task {
            do {
                let _ = try await LoginService.shared.login(email: email, password: password)
                try await LoginService.shared.registerUser(name: name)
                completion()
            } catch {
                onError(error as? ErrorAPI ?? ErrorAPI.unknown)
            }
        }
    }
}
