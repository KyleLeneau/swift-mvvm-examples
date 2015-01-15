//
//  DetailViewController.swift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 1/11/15.
//  Copyright (c) 2015 Kyle LeNeau. All rights reserved.
//

import UIKit
import ReactiveCocoa

class DetailViewController: UIViewController {

    private var viewModel = HelloWorldViewModel()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameText.text = "Planet"
        lastNameText.text = "Earth"
        
        self.viewModel.firstName <~! firstNameText.rac_textColdSignal()
        self.viewModel.lastName <~! lastNameText.rac_textColdSignal()
        
        self.viewModel.fullName.startWithSink { disposable in
            return Event.sink(next: { value in
                self.titleLabel.text = "Hello, \(value)"
            })
        }
        
//        var x = self.viewModel.fullName.asDeferredRACSignal(identity)
//        RAC(self.titleLabel as NSObject, "text").assignSignal(x)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

