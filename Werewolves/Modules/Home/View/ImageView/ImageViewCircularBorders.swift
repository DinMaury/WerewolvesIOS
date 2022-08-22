//
//  ImageViewCircularBorders.swift
//  Werewolves
//
//  Created by Maury on 8/08/22.
//

import UIKit

class ImageCircularBorders: UIImageView {
    
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        
        self.layer.cornerRadius = self.frame.height / 2
    }
}
