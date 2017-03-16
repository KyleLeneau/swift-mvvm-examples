//
//  SimpleListViewModel.swift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 1/24/15.
//  Copyright (c) 2015 Kyle LeNeau. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

open class SimpleListItemViewModel {
    
    open let displayName = MutableProperty<String?>(nil)
    
    init(name: String) {
        displayName.value = name
    }
}

open class SimpleListViewModel {
    
    public enum Error: Swift.Error {
        case badItem
    }
    
    open let items = MutableProperty([SimpleListItemViewModel]())
    open let itemToAdd = MutableProperty<String?>(nil)
    
    open lazy var addEnabled: Property<Bool> = {
        return Property(initial: false, then: self.itemToAdd.producer.map { $0 != nil && !$0!.isEmpty })
    }()
    
    open lazy var addItemAction: Action<(), (), Error> = {
        return Action<(), (), Error>(enabledIf: self.addEnabled, { x in
            guard let value = self.itemToAdd.value else {
                return SignalProducer(error: .badItem)
            }
            
            self.items.value.append(SimpleListItemViewModel(name: value))
            self.itemToAdd.value = nil
            return SignalProducer.empty
        })
    }()
}
