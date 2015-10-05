//
//  ClickCounterViewController.swift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 1/16/15.
//  Copyright (c) 2015 Kyle LeNeau. All rights reserved.
//

import UIKit
import ReactiveCocoa

class ClickCounterViewController: UIViewController {
    
    private var viewModel = ClickCounterViewModel()
    
    var clickCountLabel: UILabel!
    var clickButton: UIButton!
    var clickAlertLabel: UILabel!
    var resetButton: UIButton!
    
    var clickAction: CocoaAction!
    var resetAction: CocoaAction!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    func setupBindings() {
        RAC(self.clickCountLabel, "text") <~ self.viewModel.clickCountDisplay
        RAC(self.clickButton, "enabled") <~ self.viewModel.clickEnabled.producer
        RAC(self.resetButton, "enabled") <~ self.viewModel.resetEnabled.producer
        RAC(self.resetButton, "hidden") <~ self.viewModel.resetEnabled.producer.map { !$0 }
        RAC(self.clickAlertLabel, "hidden") <~ self.viewModel.resetEnabled.producer.map { !$0 }
        
        self.clickAction = CocoaAction(self.viewModel.registerClickAction, input: 0)
        self.clickButton.addTarget(clickAction, action: CocoaAction.selector, forControlEvents: .TouchUpInside)

        self.resetAction = CocoaAction(self.viewModel.resetClicksAction, input: 0)
        self.resetButton.addTarget(resetAction, action: CocoaAction.selector, forControlEvents: .TouchUpInside)
    }

    
    
    func setupUI() {
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.clickCountLabel = UILabel(forAutoLayout: ())!
        self.clickCountLabel.textAlignment = .Center
        self.clickCountLabel.backgroundColor = UIColor.greenColor()
        self.clickCountLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        self.view.addSubview(self.clickCountLabel)
        self.clickCountLabel.autoPinToTopLayoutGuideOfViewController(self, withInset: 20.0)
        self.clickCountLabel.autoSetDimension(.Height, toSize: 60.0)
        self.clickCountLabel.autoPinEdgeToSuperviewMargin(.Left)
        self.clickCountLabel.autoPinEdgeToSuperviewMargin(.Right)
        
        self.clickButton = UIButton(forAutoLayout: ())
        self.clickButton.setTitle("Click Me", forState: .Normal)
        self.clickButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.clickButton.setTitleColor(UIColor.orangeColor(), forState: .Disabled)
        self.view.addSubview(self.clickButton)
        self.clickButton.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.clickCountLabel, withOffset: 20.0)
        self.clickButton.autoSetDimension(.Height, toSize: 40.0)
        self.clickButton.autoPinEdgeToSuperviewMargin(.Left)
        self.clickButton.autoPinEdgeToSuperviewMargin(.Right)
        
        self.clickAlertLabel = UILabel(forAutoLayout: ())
        self.clickAlertLabel.numberOfLines = 2
        self.clickAlertLabel.text = "That's too many clicks! Please stop before you wear out your fingers."
        self.clickAlertLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        self.view.addSubview(self.clickAlertLabel)
        self.clickAlertLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.clickButton, withOffset: 20.0)
        self.clickAlertLabel.autoPinEdgeToSuperviewMargin(.Left)
        self.clickAlertLabel.autoPinEdgeToSuperviewMargin(.Right)
        
        self.resetButton = UIButton(forAutoLayout: ())
        self.resetButton.setTitle("Reset Clicks", forState: .Normal)
        self.resetButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.resetButton.setTitleColor(UIColor.orangeColor(), forState: .Disabled)
        self.view.addSubview(self.resetButton)
        self.resetButton.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.clickAlertLabel, withOffset: 20.0)
        self.resetButton.autoSetDimension(.Height, toSize: 40.0)
        self.resetButton.autoPinEdgeToSuperviewMargin(.Left)
        self.resetButton.autoPinEdgeToSuperviewMargin(.Right)
    }
}
