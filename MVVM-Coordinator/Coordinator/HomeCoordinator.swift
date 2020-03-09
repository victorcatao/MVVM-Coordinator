//
//  HomeCoordinator.swift
//  MVVM-Coordinator
//
//  Created by Victor Catão on 08/03/20.
//  Copyright © 2020 Victor Catão. All rights reserved.
//

import Foundation
import RxSwift

class HomeCoordinator: BaseCoordinator {
    
    private let disposeBag = DisposeBag()
    
    override func start() {
        // Coordinator initializes and injects viewModel
        let homeViewController = HomeViewController(viewModel: HomeViewModel())
        self.navigationController.pushViewController(homeViewController, animated: true)
    }
}
