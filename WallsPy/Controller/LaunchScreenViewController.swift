//
//  LaunchScreenViewController.swift
//  WallsPy
//
//  Created by Muhammad Kumail on 3/13/24.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    let label = Label(text: "Sleep Sounds", font: .systemFont(ofSize: 34, weight: .bold), textColor: .white)
    let LaunchImage = ImageView(image: "LaunchIcon")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red: 20/255.0 , green: 25/255.0, blue: 39/255.0, alpha: 1.00)
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(label)
        view.addSubview(LaunchImage)
        
        NSLayoutConstraint.activate([
            
            LaunchImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 314),
            LaunchImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            LaunchImage.widthAnchor.constraint(equalToConstant: 104),
            LaunchImage.heightAnchor.constraint(equalToConstant: 126),
            
            label.topAnchor.constraint(equalTo: LaunchImage.bottomAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        label.textAlignment = .center
    }

}
