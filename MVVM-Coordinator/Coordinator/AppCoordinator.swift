//
//  MainCoordinator.swift
//  MVVM-Coordinator
//
//  Created by Victor Catão on 07/03/20.
//  Copyright © 2020 Victor Catão. All rights reserved.
//

import UIKit
import RxSwift

class AppCoordinator: BaseCoordinator {
    
    var window = UIWindow(frame: UIScreen.main.bounds)
    
    override func start() {
        self.navigationController.navigationBar.isHidden = true
        self.window.rootViewController = self.navigationController
        self.window.makeKeyAndVisible()
        
        let coordinator = SignInCoordinator()
        coordinator.navigationController = self.navigationController
        self.start(coordinator: coordinator)
    }
}

extension AppCoordinator: SignInFeedback {
    func didSignIn() {
        let coordinator = HomeCoordinator()
        coordinator.navigationController = self.navigationController
        self.start(coordinator: coordinator)
    }
}
