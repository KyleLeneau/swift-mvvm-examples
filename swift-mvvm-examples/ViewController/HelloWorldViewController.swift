//
//  DetailViewController.swift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 1/11/15.
//  Copyright (c) 2015 Kyle LeNeau. All rights reserved.
//

import UIKit
import ReactiveCocoa

class HelloWorldViewController: UIViewController {

    private var viewModel = HelloWorldViewModel()
    
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

    func setupBindings() {
        firstNameText.text = "Planet"
        lastNameText.text = "Earth"
        
        self.viewModel.firstName <~! firstNameText.rac_textColdSignal()
        self.viewModel.lastName <~! lastNameText.rac_textColdSignal()
        
        var x = self.viewModel.fullName.map({ "Hello, \($0)" as AnyObject? }).asDeferredRACSignal(identity)
        RAC(self.titleLabel as NSObject, "text").assignSignal(x)
    }
    
    
    
    
    
    
    func setupUI() {
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.titleLabel = UILabel(forAutoLayout: ())!
        self.titleLabel.textAlignment = .Center
        self.titleLabel.backgroundColor = UIColor.greenColor()
        self.titleLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        self.view.addSubview(self.titleLabel)
        self.titleLabel.autoPinToTopLayoutGuideOfViewController(self, withInset: 20.0)
        self.titleLabel.autoSetDimension(.Height, toSize: 60.0)
        self.titleLabel.autoPinEdgeToSuperviewMargin(.Left)
        self.titleLabel.autoPinEdgeToSuperviewMargin(.Right)
        
        self.firstNameLabel = UILabel(forAutoLayout: ())
        self.firstNameLabel.text = "First Name:"
        self.firstNameLabel.textAlignment = .Left
        self.view.addSubview(self.firstNameLabel)
        self.firstNameLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.titleLabel, withOffset: 15.0)
        self.firstNameLabel.autoPinEdgeToSuperviewMargin(.Left)
        self.firstNameLabel.autoSetDimension(.Width, toSize: 100.0)
        
        self.firstNameText = UITextField(forAutoLayout: ())!
        self.firstNameText.borderStyle = .RoundedRect
        self.view.addSubview(self.firstNameText)
        self.firstNameText.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.titleLabel, withOffset: 10.0)
        self.firstNameText.autoPinEdge(.Left, toEdge: .Right, ofView: self.firstNameLabel, withOffset: 10.0)
        self.firstNameText.autoPinEdgeToSuperviewMargin(.Right)

        self.lastNameLabel = UILabel(forAutoLayout: ())
        self.lastNameLabel.text = "Last Name:"
        self.lastNameLabel.textAlignment = .Left
        self.view.addSubview(self.lastNameLabel)
        self.lastNameLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.firstNameLabel, withOffset: 20.0)
        self.lastNameLabel.autoPinEdgeToSuperviewMargin(.Left)
        self.lastNameLabel.autoSetDimension(.Width, toSize: 100.0)
        
        self.lastNameText = UITextField(forAutoLayout: ())!
        self.lastNameText.borderStyle = .RoundedRect
        self.view.addSubview(self.lastNameText)
        self.lastNameText.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.firstNameText, withOffset: 10.0)
        self.lastNameText.autoPinEdge(.Left, toEdge: .Right, ofView: self.lastNameLabel, withOffset: 10.0)
        self.lastNameText.autoPinEdgeToSuperviewMargin(.Right)
    }
}

