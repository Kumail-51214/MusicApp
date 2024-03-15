//
//  Label.swift
//  WallsPy
//
//  Created by Muhammad Kumail on 3/10/24.
//

import UIKit

class Label: UILabel {

    required init(text:String, font:UIFont, textColor:UIColor, textAlignment: NSTextAlignment = .left) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.textAlignment = textAlignment
        self.font = font
        self.textColor = textColor
        self.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
