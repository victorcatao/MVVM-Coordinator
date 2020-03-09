//
//  Model.swift
//  MVVM-Coordinator
//
//  Created by Victor Catão on 08/03/20.
//  Copyright © 2020 Victor Catão. All rights reserved.
//

import Foundation
import RxSwift

protocol Authentication {
    func signIn() -> Single<SignInResponse>
}

final class SessionService: Authentication {
    func signIn() -> Single<SignInResponse> {
        return Single<SignInResponse>.create { single in
            // Should call to backend
            single(.success(SignInResponse(token: "12345", userId: "5678")))
            return Disposables.create()
        }
    }
}
