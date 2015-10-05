//
//  MasterViewController.swift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 1/11/15.
//  Copyright (c) 2015 Kyle LeNeau. All rights reserved.
//

import UIKit

class ExampleCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .Subtitle, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MasterViewController: UITableViewController {

    let examples = [
        Example(type: .HelloWorld, title: "Hello World", description: "Simple Textbox form that updates a UILabel"),
        Example(type: .ClickCounter, title: "Click Counter", description: "Tracking dependencies and enabling inputs"),
        Example(type: .SimpleList, title: "Simple List", description: "This example demonstrates binding to an array of values.")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Examples"
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            self.clearsSelectionOnViewWillAppear = false
            self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
        }
        
        self.tableView.rowHeight = 90.0
        self.tableView.registerClass(ExampleCell.self, forCellReuseIdentifier: "Cell")
    }

    // MARK: - Table View

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examples.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let example = examples[indexPath.row] as Example
        cell.textLabel?.text = example.title;
        cell.detailTextLabel?.text = example.description
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let example = examples[indexPath.row] as Example
        var detailVC: UIViewController?
        
        switch example.type {
        case .HelloWorld: detailVC = HelloWorldViewController()
        case .ClickCounter: detailVC = ClickCounterViewController()
        case .SimpleList: detailVC = SimpleListViewController()
        }
        
        if let vc = detailVC {
            vc.title = example.title
            let nav = UINavigationController(rootViewController: vc)
            nav.extendedLayoutIncludesOpaqueBars = false
            nav.edgesForExtendedLayout = .None
            self.splitViewController?.showDetailViewController(nav, sender: self)
        }
    }
}

