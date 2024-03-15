//
//  CollectionViewCell.swift
//  WallsPy
//
//  Created by Muhammad Kumail on 3/10/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    private let onboardingImage = ImageView(image: "FirstImage")
    
    private let heading = Label(text: "Explore", font: UIFont.systemFont(ofSize: 34, weight: .bold), textColor: .white, textAlignment: .center)
    
    private let descriptionText = Label(text: "This is some dummy text", font: UIFont.systemFont(ofSize: 17, weight: .light), textColor: UIColor(red: 235/255, green: 235/255, blue: 245/255, alpha: 0.6), textAlignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews() {
        
        addSubview(onboardingImage)
        addSubview(heading)
        addSubview(descriptionText)
        
        NSLayoutConstraint.activate([
            
            onboardingImage.topAnchor.constraint(equalTo: topAnchor, constant: 111.autoSize),
            onboardingImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            onboardingImage.widthAnchor.constraint(equalToConstant: 290.autoSize),
            onboardingImage.heightAnchor.constraint(equalToConstant: 230.autoSize),
            
            heading.topAnchor.constraint(equalTo: onboardingImage.bottomAnchor, constant: 50.autoSize),
            heading.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30.autoSize),
            heading.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30.autoSize),
            
            descriptionText.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: 10.autoSize),
            descriptionText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30.autoSize),
            descriptionText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30.autoSize),
        ])
    }
    
    func configureUI(object: OnboardingData) {
        self.onboardingImage.image = UIImage(named: object.iconName)
        self.heading.text = object.headingText
        self.descriptionText.text = object.descriptionText
    }
    
}
