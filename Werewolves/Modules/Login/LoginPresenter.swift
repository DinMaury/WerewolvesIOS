import Foundation
import ConnectivityFramework
import ResourcesFramework

//MARK: - protocol
protocol LoginPresenterProtocol {
    
    var delegate: LoginPresenterDelegate? { get set }
    
    func setEmail(_ email: String)
    func setPassword(_ password: String)
    func showLogin() -> LoginViewController
    func login()
    
}

//MARK: - Delegate
protocol LoginPresenterDelegate: AnyObject {
    
    func errorToLogin(title: String, errorString: String)
    func showLoading()
    func hideLoading()
}

//MARK: Presenter
final class LoginPresenter {
    
    //MARK: - Properties
    private let router: LoginRouterProtocol
    private let interactor: LoginInteractorProtocol
    
    private var email: String = ""
    private var password: String = ""
    
    weak var delegate: LoginPresenterDelegate?
    
    //MARK: - Inits
    init(router: LoginRouterProtocol, interactor: LoginInteractorProtocol) {
        self.router = router
        self.interactor = interactor
        
        setupDataSource()
    }
}

// MARK: - LoginPresenterProtocol
extension LoginPresenter: LoginPresenterProtocol {
    
    func showLogin() -> LoginViewController {
        
        let defaults = UserDefaults.standard
        if defaults.value(forKey: "email") is String {
            
            //View existing login
            return router.showLogin(presenter: self)
        } else {
            return router.showLogin(presenter: self)
        }
    }
    
    func setEmail(_ email: String) {
        self.email = email
    }
    
    func setPassword(_ password: String) {
        self.password = password
    }
    
    func login() {
        
        guard !email.isEmpty else {
            delegate?.errorToLogin(title: LanguageString.errorTitle.localized, errorString: LanguageString.errorEmailEmptyDescription.localized)
            return
        }
        guard !password.isEmpty else {
            delegate?.errorToLogin(title: LanguageString.errorTitle.localized, errorString: LanguageString.errorPasswordEmptyDescription.localized)
            return
        }
        delegate?.showLoading()
        interactor.login(email: email, password: password) { status in
            
        } onError: { [weak self] error in
                
                switch error {
                                        
                case .emailAlreadyInUse:
                    self?.delegate?.errorToLogin(title: LanguageString.errorTitle.localized, errorString: LanguageString.errorTitle.localized)
                    
                case .invalidEmail:
                    self?.delegate?.errorToLogin(title: LanguageString.errorTitle.localized, errorString: LanguageString.errorInvalidEmailDescription.localized)
                    
                case .weakPassword:
                    self?.delegate?.errorToLogin(title: LanguageString.errorTitle.localized, errorString: LanguageString.errorWeakPasswordDrescription.localized)
                    
                case .wrongPassword:
                    self?.delegate?.errorToLogin(title: LanguageString.errorTitle.localized, errorString: LanguageString.errorWrongPasswordDescription.localized)
                    
                default:
                    self?.delegate?.errorToLogin(title: LanguageString.errorTitle.localized, errorString: LanguageString.errorUnknownTitleDescription.localized)
                }
        }
        router.showGame()
    }
}

//MARK: - Private
private extension LoginPresenter {
    
    func setupDataSource() {
        
    }
}
