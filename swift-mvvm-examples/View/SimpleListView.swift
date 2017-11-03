//
//  SimpleListswift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 11/3/17.
//  Copyright © 2017 Kyle LeNeau. All rights reserved.
//

import Foundation

class SimpleListView: UIView {

    let newItemLabel = UILabel()
    let newItemText = UITextField()
    let addNewItem = UIButton()
    let itemsTableView = UITableView()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }

    fileprivate func setupUI() {
        backgroundColor = UIColor.white

        addNewItem.translatesAutoresizingMaskIntoConstraints = false
        addNewItem.setTitle("Add", for: UIControlState())
        addNewItem.setTitleColor(UIColor.blue, for: UIControlState())
        addNewItem.setTitleColor(UIColor.darkGray, for: .highlighted)
        addNewItem.setTitleColor(UIColor.darkGray, for: .disabled)
        addNewItem.backgroundColor = UIColor.lightGray
        addSubview(addNewItem)
        NSLayoutConstraint.activate([
            addNewItem.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 15.0),
            addNewItem.heightAnchor.constraint(equalToConstant: 40.0),
            addNewItem.widthAnchor.constraint(equalToConstant: 50.0),
            addNewItem.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            ])

        newItemLabel.translatesAutoresizingMaskIntoConstraints = false
        newItemLabel.text = "New Item:"
        newItemLabel.textAlignment = .left
        addSubview(newItemLabel)
        NSLayoutConstraint.activate([
            newItemLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 15.0),
            newItemLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            newItemLabel.widthAnchor.constraint(equalToConstant: 80.0),
            newItemLabel.heightAnchor.constraint(equalTo: addNewItem.heightAnchor),
            ])

        newItemText.translatesAutoresizingMaskIntoConstraints = false
        newItemText.borderStyle = .roundedRect
        addSubview(newItemText)
        NSLayoutConstraint.activate([
            newItemText.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 15.0),
            newItemText.leadingAnchor.constraint(equalTo: newItemLabel.trailingAnchor, constant: 10.0),
            newItemText.trailingAnchor.constraint(equalTo: addNewItem.leadingAnchor, constant: -10.0),
            newItemText.heightAnchor.constraint(equalTo: addNewItem.heightAnchor),
            ])

        itemsTableView.translatesAutoresizingMaskIntoConstraints = false
        itemsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        addSubview(itemsTableView)
        NSLayoutConstraint.activate([
            itemsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            itemsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            itemsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            itemsTableView.topAnchor.constraint(equalTo: addNewItem.bottomAnchor, constant: 15.0)
            ])
    }
}
