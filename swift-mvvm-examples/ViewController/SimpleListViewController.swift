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
//        setupUI()
//        setupBindings()
    }
    
//    func setupBindings() {
//        self.viewModel.items.producer.start({ s in
//            self.itemsTableView.reloadData()
//        })
//        
//        viewModel.itemToAdd <~ newItemText.reactive.continuousTextValues
//        newItemText.reactive.text <~ viewModel.itemToAdd
//        addNewItem.reactive.isEnabled <~ viewModel.addEnabled
//        
//        addAction = CocoaAction(viewModel.addItemAction)
//        addNewItem.addTarget(addAction, action: CocoaAction<Any>.selector, for: .touchUpInside)
//    }    
    
    
    
    
    
    
    
//    func setupUI() {
//        self.view.backgroundColor = UIColor.white
//
//        self.addNewItem = UIButton(forAutoLayout: ())
//        self.addNewItem.setTitle("Add", for: UIControlState())
//        self.addNewItem.setTitleColor(UIColor.blue, for: UIControlState())
//        self.addNewItem.setTitleColor(UIColor.darkGray, for: .highlighted)
//        self.addNewItem.setTitleColor(UIColor.darkGray, for: .disabled)
//        self.addNewItem.backgroundColor = UIColor.lightGray
//        self.view.addSubview(self.addNewItem)
//        self.addNewItem.autoPin(toTopLayoutGuideOf: self, withInset: 15.0)
//        self.addNewItem.autoSetDimensions(to: CGSize(width: 50.0, height: 40.0))
//        self.addNewItem.autoPinEdge(toSuperviewMargin: .right)
//
//        self.newItemLabel = UILabel(forAutoLayout: ())
//        self.newItemLabel.text = "New Item:"
//        self.newItemLabel.textAlignment = .left
//        self.view.addSubview(self.newItemLabel)
//        self.newItemLabel.autoPin(toTopLayoutGuideOf: self, withInset: 15.0)
//        self.newItemLabel.autoPinEdge(toSuperviewMargin: .left)
//        self.newItemLabel.autoSetDimension(.width, toSize: 80.0)
//        self.newItemLabel.autoMatch(.height, to: .height, of: self.addNewItem)
//
//        self.newItemText = UITextField(forAutoLayout: ())
//        self.newItemText.borderStyle = .roundedRect
//        self.view.addSubview(self.newItemText)
//        self.newItemText.autoPin(toTopLayoutGuideOf: self, withInset: 15.0)
//        self.newItemText.autoPinEdge(.left, to: .right, of: self.newItemLabel, withOffset: 10.0)
//        self.newItemText.autoPinEdge(.right, to: .left, of: self.addNewItem, withOffset: -10.0)
//        self.newItemText.autoMatch(.height, to: .height, of: self.addNewItem)
//
//        self.itemsTableView = UITableView(forAutoLayout: ())
//        self.itemsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        self.itemsTableView.dataSource = self
//        self.view.addSubview(self.itemsTableView)
//        self.itemsTableView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero, excludingEdge: .top)
//        self.itemsTableView.autoPinEdge(.top, to: .bottom, of: self.addNewItem, withOffset: 15.0)
//    }

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
