//
//  SimpleListViewController.swift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 1/24/15.
//  Copyright (c) 2015 Kyle LeNeau. All rights reserved.
//

import UIKit
import ReactiveCocoa

class SimpleListViewController: UIViewController, UITableViewDataSource {

    private var viewModel = SimpleListViewModel()
    
    var newItemLabel: UILabel!
    var newItemText: UITextField!
    var addNewItem: UIButton!
    var itemsTableView: UITableView!
    
    var addAction: CocoaAction!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    func setupBindings() {
        self.viewModel.items.producer.start(next: { s in
            self.itemsTableView.reloadData()
        })
        
        self.viewModel.itemToAdd <~ self.newItemText.rac_textSignalProducer()
        
        self.viewModel.itemToAdd.producer.start(next: { s in
            self.newItemText.text = s
        })
        
        self.viewModel.addEnabled.producer.start(next: { b in
            self.addNewItem.enabled = b
        })
        
        self.addAction = CocoaAction(self.viewModel.addItemAction, input: "")
        self.addNewItem.addTarget(self.addAction, action: CocoaAction.selector, forControlEvents: .TouchUpInside)
    }    
    
    func setupUI() {
        self.view.backgroundColor = UIColor.whiteColor()

        self.addNewItem = UIButton(forAutoLayout: ())
        self.addNewItem.setTitle("Add", forState: .Normal)
        self.addNewItem.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.addNewItem.setTitleColor(UIColor.darkGrayColor(), forState: .Highlighted)
        self.addNewItem.setTitleColor(UIColor.darkGrayColor(), forState: .Disabled)
        self.addNewItem.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(self.addNewItem)
        self.addNewItem.autoPinToTopLayoutGuideOfViewController(self, withInset: 15.0)
        self.addNewItem.autoSetDimensionsToSize(CGSizeMake(50.0, 40.0))
        self.addNewItem.autoPinEdgeToSuperviewMargin(.Right)
        
        self.newItemLabel = UILabel(forAutoLayout: ())
        self.newItemLabel.text = "New Item:"
        self.newItemLabel.textAlignment = .Left
        self.view.addSubview(self.newItemLabel)
        self.newItemLabel.autoPinToTopLayoutGuideOfViewController(self, withInset: 15.0)
        self.newItemLabel.autoPinEdgeToSuperviewMargin(.Left)
        self.newItemLabel.autoSetDimension(.Width, toSize: 80.0)
        self.newItemLabel.autoMatchDimension(.Height, toDimension: .Height, ofView: self.addNewItem)
        
        self.newItemText = UITextField(forAutoLayout: ())
        self.newItemText.borderStyle = .RoundedRect
        self.view.addSubview(self.newItemText)
        self.newItemText.autoPinToTopLayoutGuideOfViewController(self, withInset: 15.0)
        self.newItemText.autoPinEdge(.Left, toEdge: .Right, ofView: self.newItemLabel, withOffset: 10.0)
        self.newItemText.autoPinEdge(.Right, toEdge: .Left, ofView: self.addNewItem, withOffset: -10.0)
        self.newItemText.autoMatchDimension(.Height, toDimension: .Height, ofView: self.addNewItem)
        
        self.itemsTableView = UITableView(forAutoLayout: ())
        self.itemsTableView.dataSource = self
        self.view.addSubview(self.itemsTableView)
        self.itemsTableView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero, excludingEdge: .Top)
        self.itemsTableView.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.addNewItem, withOffset: 15.0)
    }
    
    // MARK: - Table View
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.items.value.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "Cell")
        }
        
        var item = self.viewModel.items.value[indexPath.row]
        cell?.textLabel!.text = item.displayName.value
        
        return cell!
    }
}
