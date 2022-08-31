import UIKit

class HomeGameViewController: UIViewController {

    @IBOutlet weak var signOffButton: UIButton!
    
    //MARK: - Properties
    private var presenter: HomeGamePresenterProtocol
    
//    //MARK: - Inits
    init(_ presenter: HomeGamePresenterProtocol) {

        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func signOffButtonAction(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "email")
        defaults.removeObject(forKey: "provider")
        defaults.synchronize()
        //presenter.logOut()
        
    }
    // For presenter
//    private func firebaseLogOut() {
//
//        do {
//            try Auth.auth().signOut()
//        } catch {
//            // Se ha producido un error
//        }
//    }
}

extension HomeGameViewController {
    func show(in navigationController: UINavigationController) {
        presenter.show(in: navigationController)
    }
}
