//
//  ViewController.swift
//  WallsPy
//
//  Created by Muhammad Kumail on 3/9/24.
//

import UIKit

//MVC Model View Controller

class OnboardingViewController: UIViewController {
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.currentPage = 0
        pc.isUserInteractionEnabled = false
        pc.layer.speed = 0.3
        return pc
    }()
    private let collectionView:UICollectionView = {
        let view = UICollectionViewFlowLayout()
        view.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: view)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = true
        cv.isUserInteractionEnabled = true
        cv.isPagingEnabled = true
        return cv
    }()
    private let featrureArray: [OnboardingData] = OnboardingData.allCases
    
    //Color save into one place
    private let nextButton = Button(backgroundColor: .appBackgroundColor, cornerRadius: 25,title: "Next")
    
    private let labelAndImageView = ImageViewWithLabel(text: "Login with Apple", image: "apple.logo")
    
    private var currentPageIndex = 0 {
        didSet {
            pageControl.currentPage = currentPageIndex
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundColor()
        registerCell()
        setDelegatesAndDataSource()
        setupViews()
        confiureUI()
    }
    
    private func backgroundColor() {
        view.backgroundColor = UIColor(red: 20/255.0 , green: 25/255.0, blue: 39/255.0, alpha: 1.00)
    }
    
    private func registerCell() {
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    private func setDelegatesAndDataSource() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupViews() {
        view.addSubview(collectionView)
        view.addSubview(nextButton)
        view.addSubview(pageControl)
        view.addSubview(labelAndImageView)
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height - 400.autoSize),
            
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -30.autoSize),
            
            nextButton.bottomAnchor.constraint(equalTo: labelAndImageView.topAnchor, constant: -20.autoSize),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 311.autoSize),
            nextButton.heightAnchor.constraint(equalToConstant: 50.autoSize),
            
            labelAndImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40.autoSize),
            labelAndImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelAndImageView.widthAnchor.constraint(equalToConstant: 311.autoSize),
            labelAndImageView.heightAnchor.constraint(equalToConstant: 50.autoSize)
            
        ])
    }
    
    private func confiureUI() {
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.addTarget(self, action: #selector(scrollToNextPage), for: .touchUpInside)
        
        pageControl.numberOfPages = featrureArray.count
        pageControl.currentPage = 0
        //page control properties
        pageControl.pageIndicatorTintColor = UIColor(red: 33/255, green: 40/255, blue: 63/255, alpha: 1)
        pageControl.currentPageIndicatorTintColor = UIColor(red: 72/255, green: 112/255, blue: 255/255, alpha: 1)
        
        labelAndImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(loginPage))
        labelAndImageView.addGestureRecognizer(tapGesture)
    }
    
    
    @objc private func scrollToNextPage() {
        
        let indexPath = IndexPath(item: currentPageIndex + 1, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func loginPage() {
        print("Login with Apple")
    }
    

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        for cell in collectionView.visibleCells {
            let indexPath = collectionView.indexPath(for: cell)
            if let index = indexPath?.row {
                currentPageIndex = index
                print(currentPageIndex)
                setButtonText()
            }
        }
    }
    
    private func setButtonText() {
        if currentPageIndex == (featrureArray.count - 1) {
            nextButton.setTitle("Start", for: .normal)
        } else {
            nextButton.setTitle("Next", for: .normal)
        }
    }
    
    
    
}


extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featrureArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)as! CollectionViewCell
        cell.configureUI(object: featrureArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 10
        let height = collectionView.bounds.height
        return CGSize(width: width , height: height)
        
    }
}

