//
//  HelloWorldView.swift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 11/3/17.
//  Copyright © 2017 Kyle LeNeau. All rights reserved.
//

import Foundation

class HelloWorldView: UIView {

    let titleLabel = UILabel()
    let firstNameLabel = UILabel()
    let firstNameText = UITextField()
    let lastNameLabel = UILabel()
    let lastNameText = UITextField()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }

    fileprivate func setupUI() {
        self.backgroundColor = UIColor.white

        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.textAlignment = .center
        self.titleLabel.backgroundColor = UIColor.green
        self.titleLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        self.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 20.0),
            titleLabel.heightAnchor.constraint(equalToConstant: 60.0),
            titleLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
            ])

        self.firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.firstNameLabel.text = "First Name:"
        self.firstNameLabel.textAlignment = .left
        self.addSubview(self.firstNameLabel)
        NSLayoutConstraint.activate([
            firstNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15.0),
            firstNameLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            firstNameLabel.widthAnchor.constraint(equalToConstant: 100.0),
            ])

        self.firstNameText.translatesAutoresizingMaskIntoConstraints = false
        self.firstNameText.borderStyle = .roundedRect
        self.addSubview(self.firstNameText)
        NSLayoutConstraint.activate([
            firstNameText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.0),
            firstNameText.leadingAnchor.constraint(equalTo: firstNameLabel.trailingAnchor, constant: 10.0),
            firstNameText.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            ])

        self.lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.lastNameLabel.text = "Last Name:"
        self.lastNameLabel.textAlignment = .left
        self.addSubview(self.lastNameLabel)
        NSLayoutConstraint.activate([
            lastNameLabel.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 20.0),
            lastNameLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            lastNameLabel.widthAnchor.constraint(equalToConstant: 100.0),
            ])

        self.lastNameText.translatesAutoresizingMaskIntoConstraints = false
        self.lastNameText.borderStyle = .roundedRect
        self.addSubview(self.lastNameText)
        NSLayoutConstraint.activate([
            lastNameText.topAnchor.constraint(equalTo: firstNameText.bottomAnchor, constant: 10.0),
            lastNameText.leadingAnchor.constraint(equalTo: lastNameLabel.trailingAnchor, constant: 10.0),
            lastNameText.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            ])
    }
}
