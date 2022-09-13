import UIKit
import ResourcesFramework

extension UIView {
    
    func roundCorners() {
        
        layer.cornerRadius = self.bounds.height / 2
        clipsToBounds = true
    }
}
