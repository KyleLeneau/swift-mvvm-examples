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
        backgroundColor = UIColor.white

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = UIColor.green
        titleLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 20.0),
            titleLabel.heightAnchor.constraint(equalToConstant: 60.0),
            titleLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
            ])

        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        firstNameLabel.text = "First Name:"
        firstNameLabel.textAlignment = .left
        addSubview(firstNameLabel)
        NSLayoutConstraint.activate([
            firstNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15.0),
            firstNameLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            firstNameLabel.widthAnchor.constraint(equalToConstant: 100.0),
            ])

        firstNameText.translatesAutoresizingMaskIntoConstraints = false
        firstNameText.borderStyle = .roundedRect
        addSubview(firstNameText)
        NSLayoutConstraint.activate([
            firstNameText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.0),
            firstNameText.leadingAnchor.constraint(equalTo: firstNameLabel.trailingAnchor, constant: 10.0),
            firstNameText.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            ])

        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        lastNameLabel.text = "Last Name:"
        lastNameLabel.textAlignment = .left
        addSubview(lastNameLabel)
        NSLayoutConstraint.activate([
            lastNameLabel.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 20.0),
            lastNameLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            lastNameLabel.widthAnchor.constraint(equalToConstant: 100.0),
            ])

        lastNameText.translatesAutoresizingMaskIntoConstraints = false
        lastNameText.borderStyle = .roundedRect
        addSubview(lastNameText)
        NSLayoutConstraint.activate([
            lastNameText.topAnchor.constraint(equalTo: firstNameText.bottomAnchor, constant: 10.0),
            lastNameText.leadingAnchor.constraint(equalTo: lastNameLabel.trailingAnchor, constant: 10.0),
            lastNameText.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            ])
    }
}
