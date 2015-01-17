//
//  MasterViewController.swift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 1/11/15.
//  Copyright (c) 2015 Kyle LeNeau. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    let examples = [
        Example(type: .HelloWorld, title: "Hello World", description: "Simple Textbox form that updates a UILabel")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Examples"
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            self.clearsSelectionOnViewWillAppear = false
            self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
        }
        
        self.tableView.rowHeight = 90.0
    }

    // MARK: - Table View

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examples.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "Cell")
        }
        
        let example = examples[indexPath.row] as Example
        cell?.textLabel!.text = example.title;
        cell?.detailTextLabel!.text = example.description
        
        return cell!
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let example = examples[indexPath.row] as Example
        var detailVC: UIViewController?
        
        switch example.type {
        case .HelloWorld:
            detailVC = HelloWorldViewController()
        default:
            detailVC = EmptyViewController()
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

