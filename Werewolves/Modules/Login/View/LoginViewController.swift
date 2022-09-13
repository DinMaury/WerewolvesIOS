import UIKit
import SwiftUI
import ResourcesFramework

final class LoginViewController: UIViewController {
    
    //MARK: - View Login
    @IBOutlet weak var logoImg: UIImageView! {
        didSet {
            logoImg.image = Images.loginHeaderIcon.uiImage
            logoImg.roundCorners()
        }
    }
    @IBOutlet weak var emailTextField: LoginTextField! {
        didSet {
            
            emailTextField.delegate = self
            emailTextField.addLeftImageTo(img: Images.email.uiImage)
            emailTextField.textContentType = .emailAddress
            emailTextField.autocorrectionType = .no
            emailTextField.attributedPlaceholder =  NSAttributedString(string: LanguageString.emailPlaceholder.localized,
                                                                     attributes: [NSAttributedString.Key.foregroundColor: Colors.baseTitle2ForegroundColor.uiColor])
        }
    }
    @IBOutlet weak var passwordTextField: LoginTextField! {
        didSet {
            passwordTextField.delegate = self
            passwordTextField.addLeftImageTo(img: Images.password.uiImage)
            passwordTextField.addHidePassword()
            passwordTextField.textContentType = .password
            passwordTextField.attributedPlaceholder = NSAttributedString(string: LanguageString.passwordPlaceholder.localized,
                                                                         attributes: [NSAttributedString.Key.foregroundColor: Colors.baseTitle2ForegroundColor.uiColor])
        }
    }
    @IBOutlet weak var signInButton: RegularButton! {
        didSet {
            signInButton.setTitle(LanguageString.logIn.localized, for: .normal)
        }
    }
    @IBOutlet weak var googleImag: UIImageView! {
        didSet {
            googleImag.image =  Images.google.uiImage
        }
    }
    @IBOutlet weak var googleButton: UIButton! {
        didSet {
            googleButton.setTitle( "", for: .normal)
        }
    }
    @IBOutlet weak var facebookImg: UIImageView! {
        didSet {
            facebookImg.image =  Images.facebook.uiImage
        }
    }
    @IBOutlet weak var facebookButton: UIButton! {
        didSet {
            facebookButton.setTitle( "", for: .normal)
        }
    }
    @IBOutlet weak var forgotPassTextField: UILabel! {
        didSet {
            forgotPassTextField.textColor = Colors.baseTitle2ForegroundColor.uiColor
            forgotPassTextField.text = LanguageString.forgotPassword.localized
        }
    }
    @IBOutlet weak var orTextField: UITextField! {
        didSet {
            orTextField.text = LanguageString.loginDifferentMethods.localized
        }
    }
    @IBOutlet weak var msnBottomTextField: UILabel! {
        didSet {
            msnBottomTextField.text = LanguageString.loginFooterDescription.localized
        }
    }
    
    private var loadingView: UILoadingView?
    
    //MARK: - Properties
    private var presenter: LoginPresenterProtocol
    
    //MARK: - Inits
    init(_ presenter: LoginPresenterProtocol) {
        
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Cycle life
    override func viewDidLoad() {
        
        super.viewDidLoad()
        presenter.delegate = self
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func tappedToLogin(_ sender: Any) {
        
        presenter.login()
    }
    @IBAction func googleTapped(_ sender: Any) {
        // Login Google
    }
    
    @IBAction func facebookTapped(_ sender: Any) {
        // Login Facebook
    }
}

//MARK: - LoginPresenterDelegate
extension LoginViewController: LoginPresenterDelegate {
    
    
    func showLoading() {
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.loadingView = UILoadingView.show(in: self.view)
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async { [weak self] in
            self?.loadingView?.remove()
        }
    }
    
    func setupView() {
        
//MARK: - Color to Placeholder in white
        
        view.backgroundColor = Colors.baseBackgroundColor.uiColor
    }
    
//MARK: - Notifications
    func errorToLogin(title: String, errorString: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: errorString, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
//MARK: -----------------
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        switch textField {
        case emailTextField:
            presenter.setEmail(textField.text ?? "")
        case passwordTextField:
            presenter.setPassword(textField.text ?? "")
        default:
            break
        }
    }
}
