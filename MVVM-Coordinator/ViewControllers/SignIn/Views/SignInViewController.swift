//
//  MainViewController.swift
//  MVVM-Coordinator
//
//  Created by Victor Catão on 07/03/20.
//  Copyright © 2020 Victor Catão. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class SignInViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    // MARK: - Variables and Constants
    private let disposeBag = DisposeBag()
    private var viewModel: SignInViewModelType
    
    // MARK: - init
    required init(viewModel: SignInViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: SignInViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpBindings()
    }
    
    // MARK: - Rx
    private func setUpBindings() {
        
        self.emailTextField.rx.text.orEmpty
            .bind(to: viewModel.emailAddress)
            .disposed(by: self.disposeBag)
        
        self.passwordTextField.rx.text.orEmpty
            .bind(to: viewModel.password)
            .disposed(by: self.disposeBag)
        
        self.signInButton.rx.tap
            .bind { [weak self] in
                self?.viewModel.signInTapped()
            }
            .disposed(by: self.disposeBag)
        
        viewModel.isSignInActive
            .bind(to: self.signInButton.rx.isEnabled)
            .disposed(by: self.disposeBag)

        viewModel.didFailSignIn
            .subscribe(onNext: { error in
                print("Failed: \(error)")
            })
            .disposed(by: self.disposeBag)
    }
}
