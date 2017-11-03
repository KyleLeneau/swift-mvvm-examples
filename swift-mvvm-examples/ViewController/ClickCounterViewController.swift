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
    
    fileprivate let viewModel = ClickCounterViewModel()
    fileprivate let clickCounterView = ClickCounterView()

    var clickAction: CocoaAction<Any>!
    var resetAction: CocoaAction<Any>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
    }

    private func setupView() {
        clickCounterView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(clickCounterView)
        NSLayoutConstraint.activate([
            clickCounterView.topAnchor.constraint(equalTo: view.topAnchor),
            clickCounterView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            clickCounterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            clickCounterView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
    }

    private func setupBindings() {
        // Bind future values
        clickCounterView.clickCountLabel.reactive.text <~ viewModel.clickCountDisplay
        clickCounterView.clickButton.reactive.isEnabled <~ viewModel.clickEnabled
        clickCounterView.resetButton.reactive.isEnabled <~ viewModel.resetEnabled
        clickCounterView.resetButton.reactive.isHidden <~ viewModel.resetEnabled.negate()
        clickCounterView.clickAlertLabel.reactive.isHidden <~ viewModel.resetEnabled.negate()

        clickAction = CocoaAction(viewModel.registerClickAction)
        clickCounterView.clickButton.addTarget(clickAction, action: CocoaAction<Any>.selector, for: .touchUpInside)

        resetAction = CocoaAction(viewModel.resetClicksAction)
        clickCounterView.resetButton.addTarget(resetAction, action: CocoaAction<Any>.selector, for: .touchUpInside)
    }
}
