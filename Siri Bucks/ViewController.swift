//
//  ViewController.swift
//  Siri Bucks
//
//  Created by Kyle Lee on 8/21/17.
//  Copyright © 2017 Kyle Lee. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {
    
    @IBOutlet weak var balanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        INPreferences.requestSiriAuthorization { (status) in
            
        }
        
        if BankAccount.checkBalance()!.isZero {
            BankAccount.setBalance(toAmount: 1000)
        }
    }
    
    @IBAction func checkBalance() {
        guard let balance = BankAccount.checkBalance() else { return }
        balanceLabel.text = "Account Balance: $\(balance)"
    }

}

