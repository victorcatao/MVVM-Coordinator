//
//  MainViewModel.swift
//  MVVM-Coordinator
//
//  Created by Victor Catão on 07/03/20.
//  Copyright © 2020 Victor Catão. All rights reserved.
//

import Foundation
import RxSwift

protocol SignInFeedback {
    func didSignIn()
}

protocol SignInViewModelType {
    var emailAddress: BehaviorSubject<String> { get }
    var password: BehaviorSubject<String> { get }
    var isSignInActive: Observable<Bool> { get }
    var didFailSignIn: PublishSubject<Error> { get }
    
    func signInTapped()
}

final class SignInViewModel: SignInViewModelType {
    
    private let disposeBag = DisposeBag()
    private let authentication: Authentication
    
    let emailAddress = BehaviorSubject(value: "")
    let password = BehaviorSubject(value: "")
    let isSignInActive: Observable<Bool>
    
    // events
    let didSignIn = PublishSubject<Void>()
    let didFailSignIn = PublishSubject<Error>()
    
    init(authentication: Authentication) {
        self.authentication = authentication
        self.isSignInActive = Observable.combineLatest(self.emailAddress, self.password)
                                        .map { !$0.0.isEmpty && !$0.1.isEmpty }
    }
    
    func signInTapped() {
        self.authentication.signIn()
            .map { _ in }
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] _ in
                self?.didSignIn.onNext(())
            }, onError: { [weak self] error in
                self?.didFailSignIn.onNext(error)
            })
            .disposed(by: self.disposeBag)
    }
}
