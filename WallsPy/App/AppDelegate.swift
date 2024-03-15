//
//  AppDelegate.swift
//  WallsPy
//
//  Created by Muhammad Kumail on 3/9/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    var navController: UINavigationController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        presentViewController()
        return true
    }
    
    private func presentViewController() {
        window = UIWindow()
        navController = UINavigationController(rootViewController: OnboardingViewController())
        navController?.navigationBar.isHidden = true
//        navController?.setNavigationBarHidden(true, animated: false)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
