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
    
    private var viewModel: ClickCounterViewModel!
    
    var clickCountLabel: UILabel!
    var clickButton: UIButton!
    var clickAlertLabel: UILabel!
    var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    func setupBindings() {
        self.viewModel = ClickCounterViewModel()
        
        var x = self.viewModel.clickCountDisplay.map({ $0 as AnyObject? }).asDeferredRACSignal(identity)
        RAC(self.clickCountLabel as NSObject, "text").assignSignal(x)
        
        self.clickButton.addTarget(self.viewModel.registerClickCocoaAction, action: self.viewModel.registerClickCocoaAction.selector, forControlEvents: .TouchUpInside)
        
//        self.clickButton.rac_command = self.viewModel.registerClickAction.asRACCommand(<#evidence: Action<Void, Void> -> Action<AnyObject?, Output?>##Action<Void, Void> -> Action<AnyObject?, Output?>#>)
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
        self.clickButton.setTitleColor(UIColor.darkGrayColor(), forState: .Highlighted)
        self.clickButton.setTitleColor(UIColor.darkGrayColor(), forState: .Disabled)
        self.clickButton.backgroundColor = UIColor.lightGrayColor()
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
        self.resetButton.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(self.resetButton)
        self.resetButton.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.clickAlertLabel, withOffset: 20.0)
        self.resetButton.autoSetDimension(.Height, toSize: 40.0)
        self.resetButton.autoPinEdgeToSuperviewMargin(.Left)
        self.resetButton.autoPinEdgeToSuperviewMargin(.Right)
    }
}
