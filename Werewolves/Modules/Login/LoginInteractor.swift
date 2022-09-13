import Foundation
import ConnectivityFramework

typealias CompletionBlock = () -> Void
typealias CompletionErrorBlock = (ErrorAPI) -> Void
protocol LoginInteractorProtocol {
    
    func login(email: String, password: String, completion: @escaping CompletionBlock, onError: @escaping CompletionErrorBlock)
    
}


final class LoginInteractor {
    
    init() {
        
    }
}

// MARK: - LoginInteractorProtocol
extension LoginInteractor: LoginInteractorProtocol {
    
    func login(email: String, password: String, completion: @escaping CompletionBlock, onError: @escaping CompletionErrorBlock) {
        Task {
            do {
                try await LoginService.shared.login(email: email, password: password)
                completion()
            } catch {
                onError(error as? ErrorAPI ?? ErrorAPI.unknown)
            }
        }
    }
}
