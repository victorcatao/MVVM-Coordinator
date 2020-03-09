//
//  HomeViewController.swift
//  MVVM-Coordinator
//
//  Created by Victor Catão on 08/03/20.
//  Copyright © 2020 Victor Catão. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var messageLabel: UILabel!
    
    // MARK: - Constants and Variables
    private var viewModel: HomeViewModelType
    
    // MARK: - init
    required init(viewModel: HomeViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: HomeViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setups
    private func setupView() {
        self.messageLabel.text = self.viewModel.message
    }

}
