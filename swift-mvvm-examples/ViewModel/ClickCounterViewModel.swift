//
//  ClickCounterViewModel.swift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 1/16/15.
//  Copyright (c) 2015 Kyle LeNeau. All rights reserved.
//

import Foundation
import ReactiveCocoa

public class ClickCounterViewModel {

//    public let numberOfClicks = ObservableProperty(0)
//    
//    public var clickEnabled: HotSignal<Bool> {
//        return numberOfClicks.values.startMulticasted(errorHandler: nil, completionHandler: { () -> () in
//            
//        }).map { return $0 >= 3 }
//    }
//    
//    public var clickCountDisplay: ColdSignal<String> {
//        return numberOfClicks.values.map { return "You've clicked \($0) times" }
//    }
//    
//    public var registerClickAction: Action<Void, Void> {
//        return Action<Void, Void>(enabledIf: self.clickEnabled, { () in
//            return ColdSignal<Void>.empty()
//        })
//    }
//    
//    public func registerClick() {
//        self.numberOfClicks.value = self.numberOfClicks.value + 1
//    }
//    
//    public var registerClickCocoaAction: CocoaAction {
//        func action() -> ColdSignal<Void> {
//            return ColdSignal<Void>.empty()
//        }
//        
//        var a = Action<(), Void>(action)
//        return CocoaAction(a)
//    }

//    public var registerClickAction: Action<Void, Void> {
//        return CocoaAction(Action<Void, Void>(enabledIf: self.clickEnabled, { () in
//            return ColdSignal<Void>.empty()
//        }))
//    }

//        public func resetClicks() {
//        self.numberOfClicks.value = 0
//    }    
}
