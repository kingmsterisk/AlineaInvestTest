//
//  AppDelegate.swift
//  AlineaDemo
//
//  Created by Mayank(King) 09/11/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = AlineaTabbarController()
        window?.makeKeyAndVisible()
        
        return true
    }
}

