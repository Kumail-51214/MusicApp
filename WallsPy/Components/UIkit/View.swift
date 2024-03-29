//
//  View.swift
//  WallsPy
//
//  Created by Muhammad Kumail on 3/13/24.
//

import UIKit

class ImageViewWithLabel: UIView {

    let nameLabel = Label(text: "Dummy", font: .systemFont(ofSize: 17, weight: .medium), textColor: .white)
    let imageView = ImageView(image: "ThirdImage")
    
    required init(text:String, image:String) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.text = text
        self.imageView.image = UIImage(named: image)
        self.isUserInteractionEnabled = true
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(nameLabel)
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
        
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 16),
            
            imageView.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            imageView.trailingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: -10),
            imageView.widthAnchor.constraint(equalToConstant: 22),
            imageView.heightAnchor.constraint(equalToConstant: 22)
        ])
        nameLabel.textAlignment = .center
    }
}

class View: UIView {

    required init(backgroundColor: UIColor) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
