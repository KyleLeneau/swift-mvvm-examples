//
//  ClickCounterViewModel.swift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 1/16/15.
//  Copyright (c) 2015 Kyle LeNeau. All rights reserved.
//

import Foundation
import ReactiveCocoa

public final class ClickCounterViewModel {

    public let numberOfClicks = MutableProperty(0)
    
    public var clickEnabled: PropertyOf<Bool> {
        let property = MutableProperty(false)
        
        func enabled(x: Int) -> Bool {
            return x <= 3
        }
        
        numberOfClicks.producer
            |> map(enabled)
            // FIXME: Workaround for <~ being disabled on SignalProducers.
            |> startWithSignal { signal, disposable in
                let bindDisposable = property <~ signal
                disposable.addDisposable(bindDisposable)
            }
        
        return PropertyOf(property)
    }
    
    public var clickCountDisplay: SignalProducer<String, NoError> {
        return numberOfClicks.producer
            |> map { return "You've clicked \($0) times" }
    }
    
    public var registerClickAction: Action<AnyObject?, AnyObject, NSError> {
        return Action<AnyObject?, AnyObject, NSError>(enabledIf: clickEnabled, { x in
            self.numberOfClicks.value += 1
            return SignalProducer.empty
        })
    }
    
    public var resetClicksAction: Action<AnyObject?, AnyObject, NSError> {
        return Action<AnyObject?, AnyObject, NSError>({ x in
            self.numberOfClicks.value = 0
            return SignalProducer.empty
        })
    }   
}
