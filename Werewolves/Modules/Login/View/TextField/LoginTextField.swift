import UIKit
import ResourcesFramework

class LoginTextField: UITextField {
    
    var iconClickTextField = true
    
    override func awakeFromNib() {
        setupView()
    }
}
extension LoginTextField {
    
    func setupView() {
        
        self.borderStyle = .roundedRect
        self.textColor = Colors.baseTitle1ForegroundColor.uiColor
        layer.cornerRadius = self.frame.height / 3
        clipsToBounds = true
        self.backgroundColor = Colors.baseTextViewBackgroundColor.uiColor
    }
    
    func addLeftImageTo(img: UIImage) {
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView(image: img)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            imageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10),
            imageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5),
            imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5)
        ])
        
        imageView.tintColor = Colors.baseTitle1ForegroundColor.uiColor
        
        leftView = containerView
        leftViewMode = .always
    }
    
    func addHidePassword() {
        
        let img: UIImage = Images.invisible.uiImage
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView(image: img)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            imageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10),
            imageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5)
        ])
        imageView.tintColor = Colors.baseTitle1ForegroundColor.uiColor
        self.rightView = containerView
        self.rightViewMode = .always
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        
        imageView.isUserInteractionEnabled = true
        self.isSecureTextEntry = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        let imageiconTextField = UIImageView()
        
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if iconClickTextField {
            iconClickTextField = false
            tappedImage.image = Images.visible.uiImage
            imageiconTextField.tintColor = .white
            self.isSecureTextEntry = false
            
        } else {
            iconClickTextField = true
            tappedImage.image = Images.invisible.uiImage
            imageiconTextField.tintColor = .white
            self.isSecureTextEntry = true
            
        }
    }
}
