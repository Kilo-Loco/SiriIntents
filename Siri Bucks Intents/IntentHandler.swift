//
//  IntentHandler.swift
//  Siri Bucks Intents
//
//  Created by Kyle Lee on 8/21/17.
//  Copyright © 2017 Kyle Lee. All rights reserved.
//

import Intents

class IntentHandler: INExtension {}

extension IntentHandler: INSendPaymentIntentHandling {
    func handle(sendPayment intent: INSendPaymentIntent, completion: @escaping (INSendPaymentIntentResponse) -> Void) {
        guard let amount = intent.currencyAmount?.amount?.doubleValue else {
            completion(INSendPaymentIntentResponse(code: .failure, userActivity: nil))
            return
        }
        BankAccount.withdraw(amount: amount)
        completion(INSendPaymentIntentResponse(code: .success, userActivity: nil))
    }
}

extension IntentHandler: INRequestPaymentIntentHandling {
    func handle(requestPayment intent: INRequestPaymentIntent, completion: @escaping (INRequestPaymentIntentResponse) -> Void) {
        
        guard let amount = intent.currencyAmount?.amount?.doubleValue else {
            completion(INRequestPaymentIntentResponse(code: .failure, userActivity: nil))
            return
        }
        BankAccount.deposit(amount: amount)
        completion(INRequestPaymentIntentResponse(code: .success, userActivity: nil))
    }
}

