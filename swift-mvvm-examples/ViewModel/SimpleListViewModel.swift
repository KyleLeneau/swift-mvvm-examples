//
//  SimpleListViewModel.swift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 1/24/15.
//  Copyright (c) 2015 Kyle LeNeau. All rights reserved.
//

import Foundation
import ReactiveCocoa

public class SimpleListItemViewModel {
    
    public let displayName = MutableProperty("")
    
    init(name: String) {
        displayName.value = name
    }
}

public class SimpleListViewModel {
    
    public let items = MutableProperty([SimpleListItemViewModel]())
    public let itemToAdd = MutableProperty("")
    
    private var addEnabled: PropertyOf<Bool> {
        let property = MutableProperty(false)
        
        func enabled(x: String) -> Bool {
            return countElements(x) > 0
        }
        
        itemToAdd.producer
            |> map(enabled)
            // FIXME: Workaround for <~ being disabled on SignalProducers.
            |> startWithSignal { signal, disposable in
                let bindDisposable = property <~ signal
                disposable.addDisposable(bindDisposable)
        }
        
        return PropertyOf(property)
    }
    
    public var addItemAction: Action<AnyObject?, AnyObject, NSError> {
        return Action<AnyObject?, AnyObject, NSError>(enabledIf: addEnabled, { x in
            self.items.value.append(SimpleListItemViewModel(name: self.itemToAdd.value))
            self.itemToAdd.value = ""
            return SignalProducer.empty
        })
    }
}
