//
//  BankAccount.swift
//  Siri Bucks
//
//  Created by Kyle Lee on 8/21/17.
//  Copyright © 2017 Kyle Lee. All rights reserved.
//

import Foundation

class BankAccount {
    
    private init() {}
    static let bankAccountKey = "Bank Account"
    static let suiteName = "group.com.kiloloco.Siri-Bucks"
    
    static func setBalance(toAmount amount: Double) {
        guard let defaults = UserDefaults(suiteName: suiteName) else { return }
        defaults.set(amount, forKey: bankAccountKey)
        defaults.synchronize()
    }
    
    static func checkBalance() -> Double? {
        guard let defaults = UserDefaults(suiteName: suiteName) else { return nil }
        defaults.synchronize()
        let balance = defaults.double(forKey: bankAccountKey)
        return balance
    }
    
    @discardableResult
    static func withdraw(amount: Double) -> Double? {
        guard let defaults = UserDefaults(suiteName: suiteName) else { return nil }
        let balance = defaults.double(forKey: bankAccountKey)
        let newBalance = balance - amount
        setBalance(toAmount: newBalance)
        return newBalance
    }
    
    @discardableResult
    static func deposit(amount: Double) -> Double? {
        guard let defaults = UserDefaults(suiteName: suiteName) else { return nil }
        let balance = defaults.double(forKey: bankAccountKey)
        let newBalance = balance + amount
        setBalance(toAmount: newBalance)
        return newBalance
    }
    
}
