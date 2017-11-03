//
//  ClickCounterViewController.swift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 1/16/15.
//  Copyright (c) 2015 Kyle LeNeau. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

class ClickCounterViewController: UIViewController {
    
    fileprivate var viewModel = ClickCounterViewModel()
    
    var clickCountLabel: UILabel!
    var clickButton: UIButton!
    var clickAlertLabel: UILabel!
    var resetButton: UIButton!
    
    var clickAction: CocoaAction<Any>!
    var resetAction: CocoaAction<Any>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    func setupBindings() {
        // Bind future values
        clickCountLabel.reactive.text <~ viewModel.clickCountDisplay
        clickButton.reactive.isEnabled <~ viewModel.clickEnabled
        resetButton.reactive.isEnabled <~ viewModel.resetEnabled
        resetButton.reactive.isHidden <~ viewModel.resetEnabled.negate()
        clickAlertLabel.reactive.isHidden <~ viewModel.resetEnabled.negate()

        clickAction = CocoaAction(viewModel.registerClickAction)
        clickButton.addTarget(clickAction, action: CocoaAction<Any>.selector, for: .touchUpInside)

        resetAction = CocoaAction(viewModel.resetClicksAction)
        resetButton.addTarget(resetAction, action: CocoaAction<Any>.selector, for: .touchUpInside)
    }

    
    
    
    
    
    func setupUI() {
        self.view.backgroundColor = UIColor.white

        self.clickCountLabel = UILabel()
        self.clickCountLabel.translatesAutoresizingMaskIntoConstraints = false
        self.clickCountLabel.textAlignment = .center
        self.clickCountLabel.backgroundColor = UIColor.green
        self.clickCountLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        self.view.addSubview(self.clickCountLabel)
        NSLayoutConstraint.activate([
            clickCountLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20.0),
            clickCountLabel.heightAnchor.constraint(equalToConstant: 60.0),
            clickCountLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            clickCountLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
            ])

        self.clickButton = UIButton()
        self.clickButton.translatesAutoresizingMaskIntoConstraints = false
        self.clickButton.setTitle("Click Me", for: UIControlState())
        self.clickButton.setTitleColor(UIColor.blue, for: UIControlState())
        self.clickButton.setTitleColor(UIColor.orange, for: .disabled)
        self.view.addSubview(self.clickButton)
        NSLayoutConstraint.activate([
            clickButton.topAnchor.constraint(equalTo: clickCountLabel.bottomAnchor, constant: 20.0),
            clickButton.heightAnchor.constraint(equalToConstant: 40.0),
            clickButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            clickButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
            ])

        self.clickAlertLabel = UILabel()
        self.clickAlertLabel.translatesAutoresizingMaskIntoConstraints = false
        self.clickAlertLabel.numberOfLines = 2
        self.clickAlertLabel.text = "That's too many clicks! Please stop before you wear out your fingers."
        self.clickAlertLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        self.view.addSubview(self.clickAlertLabel)
        NSLayoutConstraint.activate([
            clickAlertLabel.topAnchor.constraint(equalTo: clickButton.bottomAnchor, constant: 20.0),
            clickAlertLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            clickAlertLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
            ])

        self.resetButton = UIButton()
        self.resetButton.translatesAutoresizingMaskIntoConstraints = false
        self.resetButton.setTitle("Reset Clicks", for: UIControlState())
        self.resetButton.setTitleColor(UIColor.blue, for: UIControlState())
        self.resetButton.setTitleColor(UIColor.orange, for: .disabled)
        self.view.addSubview(self.resetButton)
        NSLayoutConstraint.activate([
            resetButton.topAnchor.constraint(equalTo: clickAlertLabel.bottomAnchor, constant: 20.0),
            resetButton.heightAnchor.constraint(equalToConstant: 40.0),
            resetButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            resetButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
            ])
    }
}
