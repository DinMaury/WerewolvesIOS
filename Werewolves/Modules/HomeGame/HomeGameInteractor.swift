import Foundation
import ConnectivityFramework

typealias CompletionUser = (User) -> Void

protocol HomeGameInteractorProtocol {
    
    func fetchUser(completion: @escaping CompletionUser, onError: @escaping CompletionErrorBlock)
    
}

final class HomeGameInteractor {
    
    init() {
        
    }
}

// MARK: - HomeDetailInteractorProtocol
extension HomeGameInteractor: HomeGameInteractorProtocol {
    
    func fetchUser(completion: @escaping CompletionUser, onError: @escaping CompletionErrorBlock) {
        Task {
            do {
                let user = try await LoginService.shared.fetchUser()
                completion(user)
            } catch {
                onError(error as? ErrorAPI ?? ErrorAPI.unknown)
            }
        }
        
    }
}
