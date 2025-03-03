//
//  BankAccountTest.swift
//  CodeTestForIViewTests
//
//  Created by Armstrong Liu on 01/03/2025.
//

import XCTest
@testable import CodeTestForIView

final class BankAccountTest: XCTestCase {
    var bankAccountSut: BankAccount?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        bankAccountSut = BankAccount(accountName: "John Smith", balance: 100, accountType: .debit)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        bankAccountSut = nil
    }

    func testGetBankAccountBalance() throws {
        // Given
        let balance = bankAccountSut?.getBalance()
        XCTAssertEqual(balance, 100, "The bank account balance should be initialized to 100")
    }
    
    func testDeposit() {
        // When
        bankAccountSut?.deposit(50)
        
        // Given
        XCTAssertEqual(bankAccountSut?.getBalance(), 150, "The bank account balance should be 150 after depositing 50")
    }
    
    func testWithdraw() throws {
        // When
        try bankAccountSut?.withdraw(20)
        
        // Given
        XCTAssertEqual(bankAccountSut?.balance, 80, "The bank account balance should be 80 after withdrawing 20")
    }
    
    func testWithdrawMoreThanBalance() {
        XCTAssertThrowsError(try bankAccountSut?.withdraw(120), "Withdrawal amount should not exceed the available balance")
    }
}
