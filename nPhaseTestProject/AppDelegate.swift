//
//  AppDelegate.swift
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

import UIKit

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Initialize the window with screen bounds
        window = UIWindow(frame: UIScreen.main.bounds)
       
        let navigationController = UINavigationController(rootViewController: ViewController())
        
        window?.rootViewController = navigationController
    
        window?.makeKeyAndVisible()
        
        
        return true
    }
}


