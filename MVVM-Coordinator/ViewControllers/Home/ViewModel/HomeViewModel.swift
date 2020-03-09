//
//  HomeViewModel.swift
//  MVVM-Coordinator
//
//  Created by Victor Catão on 08/03/20.
//  Copyright © 2020 Victor Catão. All rights reserved.
//

import Foundation

protocol HomeViewModelType {
    var message: String { get }
}

final class HomeViewModel: HomeViewModelType {
    let message: String = "Welcome to Home :)"
}
