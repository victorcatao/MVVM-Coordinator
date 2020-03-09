//
//  AppDelegate.swift
//  MVVM-Coordinator
//
//  Created by Victor Catão on 07/03/20.
//  Copyright © 2020 Victor Catão. All rights reserved.
//

import UIKit
 
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
 
    let appCoordinator = AppCoordinator()
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.appCoordinator.start()
        return true
    }
}
