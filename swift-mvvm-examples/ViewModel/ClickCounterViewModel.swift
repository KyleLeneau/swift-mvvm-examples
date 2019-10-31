//
//  ClickCounterViewModel.swift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 1/16/15.
//  Copyright (c) 2015 Kyle LeNeau. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

public class ClickCounterViewModel {

    public let numberOfClicks = MutableProperty(0)
    
    public lazy var clickEnabled: Property<Bool> = {
        return Property(initial: false, then: self.numberOfClicks.producer.map { $0 <= 3 })
    }()
    
    public lazy var resetEnabled: Property<Bool> = {
        return Property(initial: false, then: self.numberOfClicks.producer.map { $0 > 3 })
    }()
    
    public lazy var clickCountDisplay: SignalProducer<String, Never> = {
        return self.numberOfClicks.producer
            .map { return "You've clicked \($0) times" }
    }()
    
    public lazy var registerClickAction: Action<(), (), NSError> = {
        return Action<(), (), NSError>(enabledIf: self.clickEnabled, execute: { _ in
            self.numberOfClicks.value += 1
            return SignalProducer.empty
        })
    }()
    
    public lazy var resetClicksAction: Action<(), (), NSError> = {
        return Action<(), (), NSError>(enabledIf: self.resetEnabled, execute: { _ in
            self.numberOfClicks.value = 0
            return SignalProducer.empty
        })
    }()
}
