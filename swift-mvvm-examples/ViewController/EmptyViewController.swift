//
//  EmptyViewController.swift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 1/16/15.
//  Copyright (c) 2015 Kyle LeNeau. All rights reserved.
//

import UIKit

class EmptyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let label = UILabel(forAutoLayout: ())
        label.text = "Select an Example from the left"
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        self.view.addSubview(label)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20.0),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20.0),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
