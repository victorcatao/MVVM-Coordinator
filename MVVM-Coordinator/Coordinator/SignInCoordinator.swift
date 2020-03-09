//
//  SignInCoordinator.swift
//  MVVM-Coordinator
//
//  Created by Victor Catão on 08/03/20.
//  Copyright © 2020 Victor Catão. All rights reserved.
//

import Foundation
import RxSwift

class SignInCoordinator: BaseCoordinator {
    
    private let disposeBag = DisposeBag()
    
    override func start() {
        
        // Coordinator initializes and injects viewModel
        let signInViewModel = SignInViewModel(authentication: SessionService())
        let signInViewController = SignInViewController(viewModel: signInViewModel)
        
        // Coordinator subscribes to events and notifies parentCoordinator
        signInViewModel.didSignIn
            .subscribe(onNext: { [weak self] in
                guard let `self` = self else { return }
                self.navigationController.viewControllers = []
                self.parentCoordinator?.didFinish(coordinator: self)
                (self.parentCoordinator as? SignInFeedback)?.didSignIn()
            })
            .disposed(by: self.disposeBag)
        
        self.navigationController.viewControllers = [signInViewController]
    }
}
