//
//  AppDelegate.swift
//  EoKoe
//
//  Created by Jaime Costa Marques on 01/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupAppearance()
        return true
    }

    // MARK: Setup appearances
    
    private func setupAppearance() {
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().tintColor = UIColor.white
        UITabBar.appearance().tintColor = UIColor.white
    }

}

