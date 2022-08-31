import UIKit

final class HomeGameModule {
    
    private let presenter: HomeGamePresenterProtocol
    
    init() {
    
        presenter = HomeGamePresenter(router: HomeGameRouter(),
                                        interactor: HomeGameInteractor())
    }
    
}

extension HomeGameModule {
    
    func show(in navigationController: UINavigationController) {
        
        presenter.show(in: navigationController)
    }
}
