//
//  HelloWorldViewModel.swift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 1/11/15.
//  Copyright (c) 2015 Kyle LeNeau. All rights reserved.
//

import Foundation
import ReactiveCocoa

public class HelloWorldViewModel {
    
    public let firstName = MutableProperty("")
    public let lastName = MutableProperty("")
    
    public var fullName: SignalProducer<String, NoError> {
        return firstName.producer
            .combineLatestWith(lastName.producer)
            .map({ return "Hello, \($0) \($1)" })
    }
}