//
//  CircularBorders.swift
//  Werewolves
//
//  Created by Maury on 8/08/22.
//

import UIKit

class CircularBorders: UIView {
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            setupView()
        }
    }
    
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderWidth = 1.5
        self.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
    }
}

