//
//  HelloWorldViewModel.swift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 1/11/15.
//  Copyright (c) 2015 Kyle LeNeau. All rights reserved.
//

import Foundation

public class HelloWorldViewModel {
    public var firstName = ObservableProperty("")
    public var lastName = ObservableProperty("")
    
    public var fullName: ColdSignal<String> {
        return firstName.values.combineLatestWith(lastName.values).map({ (first, last) -> String in
            return "\(first) \(last)"
        })
    }
    
}