//
//  BankAccount.swift
//  CodeTestForIView
//
//  Created by Armstrong Liu on 01/03/2025.
//

import Foundation

enum BankAccountType {
    case debit
    case credit
}

enum BankAccountError: Error {
    case insufficientFunds(withdrawAmount: Double, balance: Double)
}

struct BankAccount {
    var accountName: String
    var balance: Double
    var accountType: BankAccountType
    
    mutating func deposit(_ amount: Double) {
        balance += amount
    }
    
    mutating func withdraw(_ amount: Double) throws {
        balance -= amount
        
        if balance < 0 {
            throw BankAccountError.insufficientFunds(withdrawAmount: amount, balance: balance)
        }
    }
    
    func getBalance() -> Double {
        return balance
    }
}
