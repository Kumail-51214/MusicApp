//
//  ViewController.swift
//  WallsPy
//
//  Created by Muhammad Kumail on 3/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    let pageControl: UIPageControl = {
       let pc = UIPageControl()
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.currentPage = 0
        pc.isUserInteractionEnabled = false
        pc.layer.speed = 0.3
        return pc
    }()

    let collectionView:UICollectionView = {
       let view = UICollectionViewFlowLayout()
        view.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: view)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = true
        cv.isUserInteractionEnabled = false
        return cv
    }()

    let onBoardingSlideArray:[slideData] = [slideData(image: "FirstImage", headingtext: "Exclusive Sounds", detailtext: "We have an author's library of sound that \n you will not find else where"), slideData(image: "SecondImage", headingtext: "Relax sleep sounds", detailtext: "Our sound will help to relax and improve \n your sleep health"), slideData(image: "ThirdImage", headingtext: "Story for kids", detailtext: "Famous fairy tales with soothing sound will \n help your children fall asleep faster")]
    
    let nextButton = Button(backgroundColor:UIColor(red: 33/255, green: 40/255, blue: 63/255, alpha: 1), cornerRadius: 25,title: "Next")
    
    let labelAndImageView = View(text: "Login with Apple", image: "apple.logo")
    
    var currentPageIndex = 0 {
        didSet {
            pageControl.currentPage = currentPageIndex
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent // Change status bar style to white
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundColor()
        registerCell()
        setDelegatesAndDataSource()
        setupViews()
        
    }
    
    func backgroundColor() {
        view.backgroundColor = UIColor(red: 20/255.0 , green: 25/255.0, blue: 39/255.0, alpha: 1.00)
    }

    func registerCell() {
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    func setDelegatesAndDataSource() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupViews() {
        view.addSubview(collectionView)
        view.addSubview(nextButton)
        view.addSubview(pageControl)
        view.addSubview(labelAndImageView)
        
        NSLayoutConstraint.activate([
        
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            
            nextButton.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 30),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 311),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
    
            labelAndImageView.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 20),
            labelAndImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelAndImageView.widthAnchor.constraint(equalToConstant: 311),
            labelAndImageView.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.addTarget(self, action: #selector(scrollToNextPage), for: .touchUpInside)
        
        pageControl.numberOfPages = onBoardingSlideArray.count
        pageControl.currentPage = 0
        //page control properties
        pageControl.pageIndicatorTintColor = UIColor(red: 33/255, green: 40/255, blue: 63/255, alpha: 1)
        pageControl.currentPageIndicatorTintColor = UIColor(red: 72/255, green: 112/255, blue: 255/255, alpha: 1)
        
        labelAndImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(loginPage))
        labelAndImageView.addGestureRecognizer(tapGesture)
    }
    
    func updateButtonTitle() {
        
        if currentPageIndex == pageControl.numberOfPages - 1 {
            nextButton.setTitle("Start", for: .normal)

        }
        else{
            nextButton.setTitle("Next", for: .normal)
        }
    }
    
    @objc func scrollToNextPage() {
        let nextPageIndex = currentPageIndex + 1
        let screenWidth = collectionView.frame.width
        let contentOffSetX = CGFloat(nextPageIndex) * screenWidth
        
        if nextPageIndex < onBoardingSlideArray.count {
            
            collectionView.setContentOffset(CGPoint(x: contentOffSetX, y: 0), animated: true)
            currentPageIndex = nextPageIndex
        }
        else {
            print("Next Controller")
        }
        updateButtonTitle()
    }
    
    @objc func loginPage() {
        print("Login with Apple")
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onBoardingSlideArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)as! CollectionViewCell
        cell.onboardingImage.image = UIImage(named: "\(onBoardingSlideArray[indexPath.row].image)")
        cell.heading.text = onBoardingSlideArray[indexPath.row].headingtext
        cell.descriptionText.text = onBoardingSlideArray[indexPath.row].detailtext
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 10
        let height = collectionView.bounds.height
        return CGSize(width: width , height: height)

    }
}

