//
//  RACSignal+Extensions.swift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 1/11/15.
//  Copyright (c) 2015 Kyle LeNeau. All rights reserved.
//

import Foundation
import ReactiveCocoa

extension UITextField {
    
    func rac_textSignalProducer() -> SignalProducer<String, NSError> {
        return self.rac_textSignal().asSignalProducer()
            |> map({ $0 as String })
    }
}

extension RACSignal {
    
    func subscribeNextAs<T>(nextClosure:(T) -> ()) ->() {
        self.subscribeNext { (next: AnyObject!) -> () in
            let nextAsT = next as T
            nextClosure(nextAsT)
        }
    }
    
    func subscribeNextAs<T>(nextClosure:(T) -> (), completed: () -> ()) ->() {
        self.subscribeNext({ (next: AnyObject!) -> () in
            let nextAsT = next as T
            nextClosure(nextAsT)
            }, completed: completed)
    }
    
    func subscribeNextAs<T>(nextClosure:(T) -> (), error:(NSError) -> (), completed: () -> ()) ->() {
        self.subscribeNext({ (next: AnyObject!) -> () in
            let nextAsT = next as T
            nextClosure(nextAsT)
            }, error: { (err: NSError!) -> Void in
                error(err)
            }, completed: completed)
    }
    
    func subscribeNextAs<T>(nextClosure:(T) -> (), error:(NSError) -> ()) ->() {
        self.subscribeNext({ (next: AnyObject!) -> () in
            let nextAsT = next as T
            nextClosure(nextAsT)
            }, error: { (err: NSError!) -> Void in
                error(err)
        })
    }
    
    func flattenMapAs<T: AnyObject>(flattenMapClosure:(T) -> RACSignal) -> RACSignal {
        return self.flattenMap { (next: AnyObject!) -> RACStream! in
            let nextAsT = next as T
            return flattenMapClosure(nextAsT)
        }
    }
    
    func mapAs<T: AnyObject, U: AnyObject>(mapClosure:(T) -> U) -> RACSignal {
        return self.map { (next: AnyObject!) -> AnyObject! in
            let nextAsT = next as T
            return mapClosure(nextAsT)
        }
    }
    
    func filterAs<T: AnyObject>(filterClosure:(T) -> Bool) -> RACSignal {
        return self.filter { (next: AnyObject!) -> Bool in
            let nextAsT = next as T
            return filterClosure(nextAsT)
        }
    }
    
    func doNextAs<T: AnyObject>(nextClosure:(T) -> ()) -> RACSignal {
        return self.doNext { (next: AnyObject!) -> () in
            let nextAsT = next as T
            nextClosure(nextAsT)
        }
    }
}

// So I expect the ReactiveCocoa fellows to figure out a replacement API for the RAC macro.
// Currently, I don't see one there, so we'll use this solution until an official one exists.

// Pulled from http://www.scottlogic.com/blog/2014/07/24/mvvm-reactivecocoa-swift.html

public struct RAC {
    var target : NSObject!
    var keyPath : String!
    var nilValue : AnyObject!
    
    init(_ target: NSObject!, _ keyPath: String, nilValue: AnyObject? = nil) {
        self.target = target
        self.keyPath = keyPath
        self.nilValue = nilValue
    }
    
    func assignSignal(signal : RACSignal) -> RACDisposable {
        return signal.setKeyPath(self.keyPath, onObject: self.target, nilValue: self.nilValue)
    }
}

infix operator <~ {
    associativity right
    precedence 90
}

public func <~ (rac: RAC, signal: RACSignal) -> RACDisposable {
    return signal ~> rac
}

public func ~> (signal: RACSignal, rac: RAC) -> RACDisposable {
    return rac.assignSignal(signal)
}

func RACObserve(target: NSObject!, keyPath: String) -> RACSignal  {
    return target.rac_valuesForKeyPath(keyPath, observer: target)
}
