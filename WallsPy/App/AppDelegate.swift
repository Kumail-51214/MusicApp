//
//  AppDelegate.swift
//  WallsPy
//
//  Created by Muhammad Kumail on 3/9/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?
    let launchScreenDuration:TimeInterval = 100.0
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch
        
        
        let launchScreenController = LaunchScreenViewController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = launchScreenController
        window?.makeKeyAndVisible()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + launchScreenDuration){
            self.showMainViewController()
        }
        
        return true
    }
    
    func showMainViewController() {
        let mainViewController = ViewController()
        
        if let appdelegate = UIApplication.shared.delegate as? AppDelegate {
            appdelegate.window?.rootViewController = mainViewController
        }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

