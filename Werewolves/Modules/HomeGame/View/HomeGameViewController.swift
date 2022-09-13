import UIKit
import ResourcesFramework
import ConnectivityFramework

class HomeGameViewController: UIViewController {

    @IBOutlet weak var createRoomButton: RegularButton! {
        didSet {
            createRoomButton.setTitle(LanguageString.createARoom.localized, for: .normal)
        }
    }
    
    @IBOutlet weak var joinRoomButton: RegularButton! {
        didSet {
            joinRoomButton.setTitle(LanguageString.joinARoom.localized, for: .normal)
        }
    }
    
    @IBOutlet weak var aboutTheGameButton: RegularButton! {
        didSet {
            aboutTheGameButton.setTitle("About This Game", for: .normal)
        }
    }
    
    @IBOutlet weak var signOffButton: RegularButton! {
        didSet {
            signOffButton.setTitle(LanguageString.logout.localized, for: .normal)
        }
    }
    
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
        presenter.delegate = self
        setupView()
        presenter.fetchUser()
        
    }
    @IBAction func signOffButtonAction(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "email")
        defaults.removeObject(forKey: "provider")
        defaults.synchronize()
        presenter.logOut()
        
    }
}

extension HomeGameViewController: HomeGamePresenterDelegate {
    func show(in navigationController: UINavigationController) {
        presenter.show(in: navigationController)
    }
    
    func setupView() {
        
        view.backgroundColor = Colors.baseBackgroundColor.uiColor
    }
    
    func missingUser () {
        DispatchQueue.main.async {
            
            let alert = UIAlertController(title: "Missing Name", message: "Insert Name for game", preferredStyle: .alert)
                    alert.addTextField { (textField) in
                        textField.placeholder = "Insert Name..."
                    }

                    alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: { [weak alert] _ in
                        guard let textField = alert?.textFields?[0], let name = textField.text else { return }
                        self.presenter.setName(name)
                    }))

                    self.present(alert, animated: true, completion: nil)
        }
    }
    
    func errorToName(title: String, errorString: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: errorString, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    func presenterUserName(title: String, message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
