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
        self.view.backgroundColor = UIColor.whiteColor()
        
        let label = UILabel(forAutoLayout: ())
        label.text = "Select an Example from the left"
        label.textAlignment = .Center
        label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        self.view.addSubview(label)
        label.autoPinToTopLayoutGuideOfViewController(self, withInset: 20.0)
        label.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(0.0, 20.0, 20.0, 20.0), excludingEdge: .Top)
    }
}
