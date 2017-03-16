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
        resetButton.reactive.isHidden <~ viewModel.resetEnabled.negated
        clickAlertLabel.reactive.isHidden <~ viewModel.resetEnabled.negated
        
        clickAction = CocoaAction(viewModel.registerClickAction)
        clickButton.addTarget(clickAction, action: CocoaAction<Any>.selector, for: .touchUpInside)

        resetAction = CocoaAction(viewModel.resetClicksAction)
        resetButton.addTarget(resetAction, action: CocoaAction<Any>.selector, for: .touchUpInside)
    }

    
    
    
    
    
    
    func setupUI() {
        self.view.backgroundColor = UIColor.white
        
        self.clickCountLabel = UILabel(forAutoLayout: ())
        self.clickCountLabel.textAlignment = .center
        self.clickCountLabel.backgroundColor = UIColor.green
        self.clickCountLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        self.view.addSubview(self.clickCountLabel)
        self.clickCountLabel.autoPin(toTopLayoutGuideOf: self, withInset: 20.0)
        self.clickCountLabel.autoSetDimension(.height, toSize: 60.0)
        self.clickCountLabel.autoPinEdge(toSuperviewMargin: .left)
        self.clickCountLabel.autoPinEdge(toSuperviewMargin: .right)
        
        self.clickButton = UIButton(forAutoLayout: ())
        self.clickButton.setTitle("Click Me", for: UIControlState())
        self.clickButton.setTitleColor(UIColor.blue, for: UIControlState())
        self.clickButton.setTitleColor(UIColor.orange, for: .disabled)
        self.view.addSubview(self.clickButton)
        self.clickButton.autoPinEdge(.top, to: .bottom, of: self.clickCountLabel, withOffset: 20.0)
        self.clickButton.autoSetDimension(.height, toSize: 40.0)
        self.clickButton.autoPinEdge(toSuperviewMargin: .left)
        self.clickButton.autoPinEdge(toSuperviewMargin: .right)
        
        self.clickAlertLabel = UILabel(forAutoLayout: ())
        self.clickAlertLabel.numberOfLines = 2
        self.clickAlertLabel.text = "That's too many clicks! Please stop before you wear out your fingers."
        self.clickAlertLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        self.view.addSubview(self.clickAlertLabel)
        self.clickAlertLabel.autoPinEdge(.top, to: .bottom, of: self.clickButton, withOffset: 20.0)
        self.clickAlertLabel.autoPinEdge(toSuperviewMargin: .left)
        self.clickAlertLabel.autoPinEdge(toSuperviewMargin: .right)
        
        self.resetButton = UIButton(forAutoLayout: ())
        self.resetButton.setTitle("Reset Clicks", for: UIControlState())
        self.resetButton.setTitleColor(UIColor.blue, for: UIControlState())
        self.resetButton.setTitleColor(UIColor.orange, for: .disabled)
        self.view.addSubview(self.resetButton)
        self.resetButton.autoPinEdge(.top, to: .bottom, of: self.clickAlertLabel, withOffset: 20.0)
        self.resetButton.autoSetDimension(.height, toSize: 40.0)
        self.resetButton.autoPinEdge(toSuperviewMargin: .left)
        self.resetButton.autoPinEdge(toSuperviewMargin: .right)
    }
}
