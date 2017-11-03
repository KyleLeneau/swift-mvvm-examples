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
    fileprivate var simpleListView = SimpleListView()
    
    var addAction: CocoaAction<Any>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
    }

    private func setupView() {
        simpleListView.translatesAutoresizingMaskIntoConstraints = false
        simpleListView.itemsTableView.dataSource = self
        view.addSubview(simpleListView)
        NSLayoutConstraint.activate([
            simpleListView.topAnchor.constraint(equalTo: view.topAnchor),
            simpleListView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            simpleListView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            simpleListView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
    }

    private func setupBindings() {
        self.viewModel.items.producer.start({ s in
            self.simpleListView.itemsTableView.reloadData()
        })

        viewModel.itemToAdd <~ simpleListView.newItemText.reactive.continuousTextValues
        simpleListView.newItemText.reactive.text <~ viewModel.itemToAdd
        simpleListView.addNewItem.reactive.isEnabled <~ viewModel.addEnabled

        addAction = CocoaAction(viewModel.addItemAction)
        simpleListView.addNewItem.addTarget(addAction, action: CocoaAction<Any>.selector, for: .touchUpInside)
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
