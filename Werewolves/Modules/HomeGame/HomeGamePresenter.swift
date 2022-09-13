import UIKit
import ConnectivityFramework
import ResourcesFramework

// MARK: - Protocol
protocol HomeGamePresenterProtocol {
    
    var delegate: HomeGamePresenterDelegate? { get set }
    
    func show(in navigationController: UINavigationController)
    func logOut()
    func fetchUser()
    func setName(_ name: String)
}

//MARK: - Delegates
protocol HomeGamePresenterDelegate: AnyObject {
    
    func fetchUser(user: User)
    func missingUser()
    func errorToName(title: String, errorString: String)
    func presenterUserName(title: String, message: String)
}

// MARK: - Presenter
final class HomeGamePresenter {
    
    // MARK: - Properties
    private let router: HomeGameRouterProtocol
    private let interactor: HomeGameInteractorProtocol
    
    weak var delegate: HomeGamePresenterDelegate?
    
    //MARK: - Inits
    init(router: HomeGameRouterProtocol, interactor: HomeGameInteractorProtocol) {
        
        self.router = router
        self.interactor = interactor
        setupDataSource()
    }
}

//MARK: - HomeDetailPresenterProtocol

extension HomeGamePresenter: HomeGamePresenterProtocol {
    
    func logOut() {
        Task {
            do {
                try await LoginService.shared.signOut()
            } catch {
                print("Error Cerrando sesion?")
            }
        }
    }
    
    
    func show(in navigationController: UINavigationController) {
        router.show(presenter: self, in: navigationController)
        
    }
    
    func setupDataSource() {
        
    }
    
    func fetchUser() {
        interactor.fetchUser { [weak self] user in
            
            self?.delegate?.fetchUser(user: user)
            self?.delegate?.presenterUserName(title: "Welcome", message: user.name)
            
        } onError: { [weak self] error in
            
            switch error {
                
            case .noFound:
                self?.delegate?.missingUser()
                
            default:
                //self?.delegate?.errorToName(title: LanguageString.errorTitle.localized, errorString: LanguageString.registerNameModalDescription.localized)
                self?.delegate?.missingUser()
                break
            }
        }
    }
    
    func setName(_ name: String) {
        Task {
            do {
                try await LoginService.shared.registerUser(name: name)
            } catch {
                print(error)
            }
        }
    }
}
