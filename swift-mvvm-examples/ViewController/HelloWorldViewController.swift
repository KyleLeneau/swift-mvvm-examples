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
    
    var titleLabel: UILabel!
    var firstNameLabel: UILabel!
    var firstNameText: UITextField!
    var lastNameLabel: UILabel!
    var lastNameText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }

    fileprivate func setupBindings() {
        // Set initial value and bind future values
        firstNameText.text = viewModel.firstName.value
        viewModel.firstName <~ firstNameText.reactive.continuousTextValues
        
        // Set initial value and bind future values
        lastNameText.text = viewModel.lastName.value
        viewModel.lastName <~ lastNameText.reactive.continuousTextValues
        
        // Bind future values
        titleLabel.reactive.text <~ viewModel.fullName
    }
    
    
    
    
    
    
    fileprivate func setupUI() {
        self.view.backgroundColor = UIColor.white
        
        self.titleLabel = UILabel()
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.textAlignment = .center
        self.titleLabel.backgroundColor = UIColor.green
        self.titleLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        self.view.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20.0),
            titleLabel.heightAnchor.constraint(equalToConstant: 60.0),
            titleLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
            ])
        
        self.firstNameLabel = UILabel()
        self.firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.firstNameLabel.text = "First Name:"
        self.firstNameLabel.textAlignment = .left
        self.view.addSubview(self.firstNameLabel)
        NSLayoutConstraint.activate([
            firstNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15.0),
            firstNameLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            firstNameLabel.widthAnchor.constraint(equalToConstant: 100.0),
            ])
        
        self.firstNameText = UITextField()
        self.firstNameText.translatesAutoresizingMaskIntoConstraints = false
        self.firstNameText.borderStyle = .roundedRect
        self.view.addSubview(self.firstNameText)
        NSLayoutConstraint.activate([
            firstNameText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.0),
            firstNameText.leadingAnchor.constraint(equalTo: firstNameLabel.trailingAnchor, constant: 10.0),
            firstNameText.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            ])

        self.lastNameLabel = UILabel()
        self.lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.lastNameLabel.text = "Last Name:"
        self.lastNameLabel.textAlignment = .left
        self.view.addSubview(self.lastNameLabel)
        NSLayoutConstraint.activate([
            lastNameLabel.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 20.0),
            lastNameLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            lastNameLabel.widthAnchor.constraint(equalToConstant: 100.0),
            ])
        
        self.lastNameText = UITextField()
        self.lastNameText.translatesAutoresizingMaskIntoConstraints = false
        self.lastNameText.borderStyle = .roundedRect
        self.view.addSubview(self.lastNameText)
        NSLayoutConstraint.activate([
            lastNameText.topAnchor.constraint(equalTo: firstNameText.bottomAnchor, constant: 10.0),
            lastNameText.leadingAnchor.constraint(equalTo: lastNameLabel.trailingAnchor, constant: 10.0),
            lastNameText.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            ])
    }
}

