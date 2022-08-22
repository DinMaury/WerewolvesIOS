//
//  HomeViewController.swift
//  Werewolves
//
//  Created by Maury on 8/08/22.
//

import UIKit
import SwiftUI

final class HomeViewController: UIViewController {
    
    //MARK: - View
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: ButtonCircularBorders!
    
    
    //MARK: - Variables
    var iconClickTextField = true
    let imageiconTextField = UIImageView()
    
    //MARK: - Properties
    private var presenter: HomePresenterProtocol
    
    //MARK: - Inits
    init(_ presenter: HomePresenterProtocol) {
        
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
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            presenter.login(email: email, password: password)
        }
    }
}

//MARK: - HomePresenterDelegate
extension HomeViewController: HomePresenterDelegate {
    
    func setupView() {
        
//MARK: - Color to Placeholder in white
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email...",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password...",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)])
//MARK: -----------------
        
//MARK: - Show/Hide Password
        imageiconTextField.image = UIImage(systemName: "eye.slash")
        imageiconTextField.tintColor = .white
        let contentView = UIView()
        contentView.addSubview(imageiconTextField)
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(systemName: "eye.slash")!.size.width, height: UIImage(systemName: "eye.slash")!.size.height)
        imageiconTextField.frame = CGRect(x: 0, y: 0, width: UIImage(systemName: "eye.slash")!.size.width, height: UIImage(systemName: "eye.slash")!.size.height)
        passwordTextField.rightView = contentView
        passwordTextField.rightViewMode = .always
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        
        imageiconTextField.isUserInteractionEnabled = true
        imageiconTextField.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if iconClickTextField {
            iconClickTextField = false
            tappedImage.image = UIImage(systemName: "eye")
            imageiconTextField.tintColor = .white
            passwordTextField.isSecureTextEntry = false
            
        } else {
            iconClickTextField = true
            tappedImage.image = UIImage(systemName: "eye.slash")
            imageiconTextField.tintColor = .white
            passwordTextField.isSecureTextEntry = true
            
        }
//MARK: ------------------
        
    }
    
//MARK: - Notifications
    func errorToLogin() {
        
        let alertController = UIAlertController(title: "Error", message: "Se ha producido un error de autenticación", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
//MARK: -----------------
}
