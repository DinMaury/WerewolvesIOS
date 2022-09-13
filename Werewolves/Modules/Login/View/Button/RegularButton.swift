import UIKit
import ResourcesFramework
class RegularButton: UIButton {
    
    override func awakeFromNib() {
        setupView()
    }
}
extension RegularButton {
    
    func setupView() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: Constants.regularHeight)
        ])
        self.layer.cornerRadius = Constants.regularCornerRadius
        self.backgroundColor = Colors.submitButtonBackgroundColor.uiColor
        self.tintColor = Colors.submitButtonForegroundColor.uiColor
    }
}
