//
//  LoginViewModel.swift
//  swift-mvvm-examples
//
//  Created by Kyle LeNeau on 5/16/15.
//  Copyright (c) 2015 Kyle LeNeau. All rights reserved.
//

import Foundation
import ReactiveCocoa

public class User {}

public class LoginViewModel {
    public let userName = MutableProperty<String?>(nil)
    public let password = MutableProperty<String?>(nil)
    
    public lazy var loginEnabled: AnyProperty<Bool> = {
        let property = MutableProperty(false)
        
        property <~ combineLatest(self.userName.producer, self.password.producer)
            .map { userName, password in
                if let userName = userName,
                    password = password {
                        return true
                } else {
                    return false
                }
            }
        
        return AnyProperty(property)
    }()
    
    public lazy var loginAction: Action<(String, String), User, NSError> = {
        return Action(enabledIf: self.loginEnabled, { username, password in
            return self.login(username, password: password)
        })
    }()

    private func login(username: String, password: String) -> SignalProducer<User, NSError> {
        return SignalProducer { observer, disposable in
            observer.sendCompleted()
        }
    }
}
