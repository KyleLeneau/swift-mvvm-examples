//
//  SimpleListViewController.swift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 1/24/15.
//  Copyright (c) 2015 Kyle LeNeau. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

class SimpleListViewController: UIViewController, UITableViewDataSource {

    fileprivate var viewModel = SimpleListViewModel()
    
    var newItemLabel: UILabel!
    var newItemText: UITextField!
    var addNewItem: UIButton!
    var itemsTableView: UITableView!
    
    var addAction: CocoaAction<Any>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    func setupBindings() {
        self.viewModel.items.producer.start({ s in
            self.itemsTableView.reloadData()
        })

        viewModel.itemToAdd <~ newItemText.reactive.continuousTextValues
        newItemText.reactive.text <~ viewModel.itemToAdd
        addNewItem.reactive.isEnabled <~ viewModel.addEnabled

        addAction = CocoaAction(viewModel.addItemAction)
        addNewItem.addTarget(addAction, action: CocoaAction<Any>.selector, for: .touchUpInside)
    }







    func setupUI() {
        self.view.backgroundColor = UIColor.white

        self.addNewItem = UIButton()
        self.addNewItem.translatesAutoresizingMaskIntoConstraints = false
        self.addNewItem.setTitle("Add", for: UIControlState())
        self.addNewItem.setTitleColor(UIColor.blue, for: UIControlState())
        self.addNewItem.setTitleColor(UIColor.darkGray, for: .highlighted)
        self.addNewItem.setTitleColor(UIColor.darkGray, for: .disabled)
        self.addNewItem.backgroundColor = UIColor.lightGray
        self.view.addSubview(self.addNewItem)
        NSLayoutConstraint.activate([
            addNewItem.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 15.0),
            addNewItem.heightAnchor.constraint(equalToConstant: 40.0),
            addNewItem.widthAnchor.constraint(equalToConstant: 50.0),
            addNewItem.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            ])

        self.newItemLabel = UILabel()
        self.newItemLabel.translatesAutoresizingMaskIntoConstraints = false
        self.newItemLabel.text = "New Item:"
        self.newItemLabel.textAlignment = .left
        self.view.addSubview(self.newItemLabel)
        NSLayoutConstraint.activate([
            newItemLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 15.0),
            newItemLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            newItemLabel.widthAnchor.constraint(equalToConstant: 80.0),
            newItemLabel.heightAnchor.constraint(equalTo: addNewItem.heightAnchor),
            ])

        self.newItemText = UITextField()
        self.newItemText.translatesAutoresizingMaskIntoConstraints = false
        self.newItemText.borderStyle = .roundedRect
        self.view.addSubview(self.newItemText)
        NSLayoutConstraint.activate([
            newItemText.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 15.0),
            newItemText.leadingAnchor.constraint(equalTo: newItemLabel.trailingAnchor, constant: 10.0),
            newItemText.trailingAnchor.constraint(equalTo: addNewItem.leadingAnchor, constant: -10.0),
            newItemText.heightAnchor.constraint(equalTo: addNewItem.heightAnchor),
            ])

        self.itemsTableView = UITableView()
        self.itemsTableView.translatesAutoresizingMaskIntoConstraints = false
        self.itemsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.itemsTableView.dataSource = self
        self.view.addSubview(self.itemsTableView)
        NSLayoutConstraint.activate([
            itemsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            itemsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            itemsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            itemsTableView.topAnchor.constraint(equalTo: addNewItem.bottomAnchor, constant: 15.0)
            ])
    }

    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.items.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = self.viewModel.items.value[indexPath.row]
        cell.textLabel!.text = item.displayName.value
        return cell
    }
}
