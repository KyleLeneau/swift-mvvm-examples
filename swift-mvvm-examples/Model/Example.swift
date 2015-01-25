//
//  Example.swift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 1/11/15.
//  Copyright (c) 2015 Kyle LeNeau. All rights reserved.
//

import Foundation

public enum ExampleType {
    case HelloWorld
    case ClickCounter
    case SimpleList
}

public class Example {
    
    public let type: ExampleType
    public let title: String
    public let description: String
    
    init(type: ExampleType, title: String, description: String) {
        self.type = type
        self.title = title
        self.description = description
    }
}