//
//  DetailViewController.swift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 1/11/15.
//  Copyright (c) 2015 Kyle LeNeau. All rights reserved.
//

import UIKit
import ReactiveSwift

class HelloWorldViewController: UIViewController {

    fileprivate var viewModel = HelloWorldViewModel()
    fileprivate let helloWorldView = HelloWorldView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
    }

    fileprivate func setupView() {
        helloWorldView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(helloWorldView)
        NSLayoutConstraint.activate([
            helloWorldView.topAnchor.constraint(equalTo: view.topAnchor),
            helloWorldView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            helloWorldView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            helloWorldView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
    }

    fileprivate func setupBindings() {
        // Set initial value and bind future values
        helloWorldView.firstNameText.text = viewModel.firstName.value
        viewModel.firstName <~ helloWorldView.firstNameText.reactive.continuousTextValues
        
        // Set initial value and bind future values
        helloWorldView.lastNameText.text = viewModel.lastName.value
        viewModel.lastName <~ helloWorldView.lastNameText.reactive.continuousTextValues
        
        // Bind future values
        helloWorldView.titleLabel.reactive.text <~ viewModel.fullName
    }
}

