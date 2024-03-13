//
//  File.swift
//  WallsPy
//
//  Created by Muhammad Kumail on 3/10/24.
//

import UIKit

class ImageView:UIImageView {
    
    
    required init(image:String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.image = UIImage(named: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
