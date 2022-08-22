//
//  ButtonCircleBorders.swift
//  Werewolves
//
//  Created by Maury on 8/08/22.
//

import UIKit

class ButtonCircularBorders: UIButton {
    
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        
        self.layer.cornerRadius = self.frame.height / 2
    }
}

