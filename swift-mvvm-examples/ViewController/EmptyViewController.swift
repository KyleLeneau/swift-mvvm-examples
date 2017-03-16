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
        label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        self.view.addSubview(label)
        label.autoPin(toTopLayoutGuideOf: self, withInset: 20.0)
        label.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(0.0, 20.0, 20.0, 20.0), excludingEdge: .top)
    }
}
