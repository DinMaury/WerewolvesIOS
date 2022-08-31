import UIKit
import ResourcesFramework
class RegularButton: UIButton {
    
    override func awakeFromNib() {
        setupView()
    }
}
extension RegularButton {
    
    func setupView() {
        
        self.layer.cornerRadius = self.frame.height / 2
        self.backgroundColor = Colors.submitButtonBackgroundColor.uiColor
        self.tintColor = Colors.submitButtonForegroundColor.uiColor
    }
}
