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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent // Change status bar style to white
        }
    
    
    
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
    
    let loginLabel = Label(text: "Login with Apple", font: .systemFont(ofSize: 17, weight: .medium), textColor: .white)
    let appleImage = ImageView(image: "apple.logo")
    
    var currentPageIndex = 0 {
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
        view.addSubview(loginLabel)
        loginLabel.addSubview(appleImage)
        
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
            
            loginLabel.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 30),
            loginLabel.widthAnchor.constraint(equalToConstant: 311),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            appleImage.topAnchor.constraint(equalTo: loginLabel.topAnchor),
            appleImage.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor , constant: 60),
            appleImage.widthAnchor.constraint(equalToConstant: 22),
            appleImage.heightAnchor.constraint(equalToConstant: 22)
            
        ])
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.addTarget(self, action: #selector(scrollToNextPage), for: .touchUpInside)
        
        pageControl.numberOfPages = onBoardingSlideArray.count
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor(red: 33/255, green: 40/255, blue: 63/255, alpha: 1)
        pageControl.currentPageIndicatorTintColor = UIColor(red: 72/255, green: 112/255, blue: 255/255, alpha: 1)
        
        loginLabel.textAlignment = .center
        loginLabel.isUserInteractionEnabled = true
        loginLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(loginPage)))
        
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
            print("errrr")
        }
        updateButtonTitle()
    }
    
    @objc func loginPage() {
        print("errr")
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

