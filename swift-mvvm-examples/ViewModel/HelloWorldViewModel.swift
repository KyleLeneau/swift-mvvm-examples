//
//  HelloWorldViewModel.swift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 1/11/15.
//  Copyright (c) 2015 Kyle LeNeau. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa
import Result

open class HelloWorldViewModel {
    
    open let firstName = MutableProperty<String?>("Planet")
    open let lastName = MutableProperty<String?>("Earth")
    
    open var fullName: SignalProducer<String, NoError> {
        return firstName.producer
            .combineLatest(with: lastName.producer)
            .map {
                guard let first = $0, let last = $1 else {
                    return "Hello!"
                }
                
                return "Hello, \(first) \(last)"
            }
    }
}
