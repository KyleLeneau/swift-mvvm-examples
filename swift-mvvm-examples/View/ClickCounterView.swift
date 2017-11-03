//
//  ClickCounterswift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 11/3/17.
//  Copyright © 2017 Kyle LeNeau. All rights reserved.
//

import Foundation

class ClickCounterView: UIView {

    let clickCountLabel = UILabel()
    let clickButton = UIButton()
    let clickAlertLabel = UILabel()
    let resetButton = UIButton()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }

    fileprivate func setupUI() {
        backgroundColor = UIColor.white

        clickCountLabel.translatesAutoresizingMaskIntoConstraints = false
        clickCountLabel.textAlignment = .center
        clickCountLabel.backgroundColor = UIColor.green
        clickCountLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        addSubview(clickCountLabel)
        NSLayoutConstraint.activate([
            clickCountLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 20.0),
            clickCountLabel.heightAnchor.constraint(equalToConstant: 60.0),
            clickCountLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            clickCountLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
            ])

        clickButton.translatesAutoresizingMaskIntoConstraints = false
        clickButton.setTitle("Click Me", for: UIControlState())
        clickButton.setTitleColor(UIColor.blue, for: UIControlState())
        clickButton.setTitleColor(UIColor.orange, for: .disabled)
        addSubview(clickButton)
        NSLayoutConstraint.activate([
            clickButton.topAnchor.constraint(equalTo: clickCountLabel.bottomAnchor, constant: 20.0),
            clickButton.heightAnchor.constraint(equalToConstant: 40.0),
            clickButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            clickButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
            ])

        clickAlertLabel.translatesAutoresizingMaskIntoConstraints = false
        clickAlertLabel.numberOfLines = 2
        clickAlertLabel.text = "That's too many clicks! Please stop before you wear out your fingers."
        clickAlertLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        addSubview(clickAlertLabel)
        NSLayoutConstraint.activate([
            clickAlertLabel.topAnchor.constraint(equalTo: clickButton.bottomAnchor, constant: 20.0),
            clickAlertLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            clickAlertLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
            ])

        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.setTitle("Reset Clicks", for: UIControlState())
        resetButton.setTitleColor(UIColor.blue, for: UIControlState())
        resetButton.setTitleColor(UIColor.orange, for: .disabled)
        addSubview(resetButton)
        NSLayoutConstraint.activate([
            resetButton.topAnchor.constraint(equalTo: clickAlertLabel.bottomAnchor, constant: 20.0),
            resetButton.heightAnchor.constraint(equalToConstant: 40.0),
            resetButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            resetButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
            ])
    }
}
