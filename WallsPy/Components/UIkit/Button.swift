//
//  Button.swift
//  WallsPy
//
//  Created by Muhammad Kumail on 3/10/24.
//

import UIKit

class Button: UIButton {

    required init(backgroundColor:UIColor,cornerRadius:CGFloat,title:String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.setTitle(title, for: .normal)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
