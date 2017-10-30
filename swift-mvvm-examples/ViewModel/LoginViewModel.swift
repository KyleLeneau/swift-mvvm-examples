//
//  LoginViewModel.swift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 5/16/15.
//  Copyright (c) 2015 Kyle LeNeau. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

open class User {}

open class LoginViewModel {
    open let userName = MutableProperty<String?>(nil)
    open let password = MutableProperty<String?>(nil)
    
    open lazy var loginEnabled: Property<Bool> = {
        let property = MutableProperty(false)
        
        property <~ SignalProducer.combineLatest(self.userName.producer, self.password.producer)
            .map { userName, password in
                if let userName = userName,
                    let password = password {
                        return true
                } else {
                    return false
                }
            }
        
        return Property(property)
    }()
    
    open lazy var loginAction: Action<(String, String), User, NSError> = {
        return Action(enabledIf: self.loginEnabled, execute: { username, password in
            return self.login(username, password: password)
        })
    }()

    fileprivate func login(_ username: String, password: String) -> SignalProducer<User, NSError> {
        return SignalProducer { observer, disposable in
            observer.sendCompleted()
        }
    }
}
