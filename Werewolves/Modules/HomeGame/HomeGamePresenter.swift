import UIKit

// MARK: - Protocol
protocol HomeGamePresenterProtocol {
    
    func show(in navigationController: UINavigationController)
}

//MARK: - Delegates
protocol HomeGamePresenterDelegate: AnyObject {
    
}

// MARK: - Presenter
final class HomeGamePresenter {
    
    // MARK: - Properties
    private let router: HomeGameRouterProtocol
    private let interactor: HomeGameInteractorProtocol
    
    
    
    //MARK: - Inits
    init(router: HomeGameRouterProtocol, interactor: HomeGameInteractorProtocol) {
        
        self.router = router
        self.interactor = interactor
        
        setupDataSource()
    }
}

//MARK: - HomeDetailPresenterProtocol

extension HomeGamePresenter: HomeGamePresenterProtocol {
    
    func show(in navigationController: UINavigationController) {
        router.show(presenter: self, in: navigationController)
        
    }
    
    func setupDataSource() {
        
    }
}
