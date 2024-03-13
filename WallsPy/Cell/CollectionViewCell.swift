//
//  CollectionViewCell.swift
//  WallsPy
//
//  Created by Muhammad Kumail on 3/10/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let onboardingImage = ImageView(image: "FirstImage")
    
    let heading = Label(text: "Explore", font: UIFont.systemFont(ofSize: 34, weight: .bold), textColor: .white)
    
    let descriptionText = Label(text: "This is some dummy text", font: UIFont.systemFont(ofSize: 17, weight: .light), textColor: UIColor(red: 235/255, green: 235/255, blue: 245/255, alpha: 0.6))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()

        descriptionText.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        addSubview(onboardingImage)
        addSubview(heading)
        addSubview(descriptionText)
        
        NSLayoutConstraint.activate([
            
            onboardingImage.topAnchor.constraint(equalTo: topAnchor, constant: 111),
            onboardingImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 39),
            onboardingImage.widthAnchor.constraint(equalToConstant: 290),
            onboardingImage.heightAnchor.constraint(equalToConstant: 230),
            
            heading.topAnchor.constraint(equalTo: onboardingImage.bottomAnchor, constant: 50),
            heading.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionText.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: 10),
            descriptionText.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
}
