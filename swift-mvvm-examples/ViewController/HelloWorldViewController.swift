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
        
        self.titleLabel = UILabel(forAutoLayout: ())
        self.titleLabel.textAlignment = .center
        self.titleLabel.backgroundColor = UIColor.green
        self.titleLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        self.view.addSubview(self.titleLabel)
        self.titleLabel.autoPin(toTopLayoutGuideOf: self, withInset: 20.0)
        self.titleLabel.autoSetDimension(.height, toSize: 60.0)
        self.titleLabel.autoPinEdge(toSuperviewMargin: .left)
        self.titleLabel.autoPinEdge(toSuperviewMargin: .right)
        
        self.firstNameLabel = UILabel(forAutoLayout: ())
        self.firstNameLabel.text = "First Name:"
        self.firstNameLabel.textAlignment = .left
        self.view.addSubview(self.firstNameLabel)
        self.firstNameLabel.autoPinEdge(.top, to: .bottom, of: self.titleLabel, withOffset: 15.0)
        self.firstNameLabel.autoPinEdge(toSuperviewMargin: .left)
        self.firstNameLabel.autoSetDimension(.width, toSize: 100.0)
        
        self.firstNameText = UITextField(forAutoLayout: ())
        self.firstNameText.borderStyle = .roundedRect
        self.view.addSubview(self.firstNameText)
        self.firstNameText.autoPinEdge(.top, to: .bottom, of: self.titleLabel, withOffset: 10.0)
        self.firstNameText.autoPinEdge(.left, to: .right, of: self.firstNameLabel, withOffset: 10.0)
        self.firstNameText.autoPinEdge(toSuperviewMargin: .right)

        self.lastNameLabel = UILabel(forAutoLayout: ())
        self.lastNameLabel.text = "Last Name:"
        self.lastNameLabel.textAlignment = .left
        self.view.addSubview(self.lastNameLabel)
        self.lastNameLabel.autoPinEdge(.top, to: .bottom, of: self.firstNameLabel, withOffset: 20.0)
        self.lastNameLabel.autoPinEdge(toSuperviewMargin: .left)
        self.lastNameLabel.autoSetDimension(.width, toSize: 100.0)
        
        self.lastNameText = UITextField(forAutoLayout: ())
        self.lastNameText.borderStyle = .roundedRect
        self.view.addSubview(self.lastNameText)
        self.lastNameText.autoPinEdge(.top, to: .bottom, of: self.firstNameText, withOffset: 10.0)
        self.lastNameText.autoPinEdge(.left, to: .right, of: self.lastNameLabel, withOffset: 10.0)
        self.lastNameText.autoPinEdge(toSuperviewMargin: .right)
    }
}

