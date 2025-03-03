//
//  AuthViewModelTest.swift
//  CodeTestForIViewTests
//
//  Created by Armstrong Liu on 02/03/2025.
//

import XCTest
@testable import CodeTestForIView

@MainActor
final class AuthViewModelTest: XCTestCase {
    var sut: AuthViewModel?
    var mockLoginService: MockLoginService?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        mockLoginService = MockLoginService()
        sut = AuthViewModel(loginService: mockLoginService!)
    }

    override func tearDownWithError() throws {
        mockLoginService = nil
        sut = nil
        
        try super.tearDownWithError()
    }

    func testLoginSuccess() async throws {
        // Given
        await mockLoginService?.setAuth(mockAuth)
        await mockLoginService?.setShouldReturnError(false)
        await mockLoginService?.setError(nil)
        sut?.username = "some_username"
        sut?.password = "some_password"
        
        // When
        await sut?.login()
        
        // Given
        XCTAssertEqual(sut?.loginState, .success, "Login should be successful.")
        XCTAssertNil(sut?.errMsg, "Login successfully should have NO error message.")
    }

    func testLoginFailInvalidCredentials() async throws {
        // Given
        await mockLoginService?.setAuth(nil)
        await mockLoginService?.setShouldReturnError(true)
        await mockLoginService?.setError(.invalidCredentials)
        sut?.username = "some_username"
        sut?.password = "wrong_password"
        
        // When
        await sut?.login()
        
        // Then
        XCTAssertEqual(sut?.errMsg, LoginError.invalidCredentials.errorDescription, "Login should be failed with invalid credentials.")
        XCTAssertEqual(sut?.loginState, .failure, "Login state should be failed.")
    }
    
    func testLoginFailUnknownError() async throws {
        // Given
        await mockLoginService?.setAuth(nil)
        await mockLoginService?.setShouldReturnError(true)
        await mockLoginService?.setError(.unknown)
        sut?.username = "some_username"
        sut?.password = "some_password"
        
        // When
        await sut?.login()
        
        // Then
        XCTAssertEqual(sut?.errMsg, LoginError.unknown.errorDescription, "Login should be failed with unknown error.")
        XCTAssertEqual(sut?.loginState, .failure, "Login state should be failed.")
    }
    
    func testLoginFailEmptyUsername() async throws {
        // Given
        sut?.username = ""
        sut?.password = "some_password"
        
        // When
        await sut?.login()
        
        // Then
        XCTAssertEqual(sut?.errMsg, "Empty username error", "Login should be failed with empty username.")
        XCTAssertEqual(sut?.loginState, .failure, "Login state should be failed.")
    }
    
    func testLoginFailEmptyPassword() async throws {
        // Given
        sut?.username = "username"
        sut?.password = ""
        
        // When
        await sut?.login()
        
        // Then
        XCTAssertEqual(sut?.errMsg, "Empty password error", "Login should be failed with empty password.")
        XCTAssertEqual(sut?.loginState, .failure, "Login state should be failed.")
    }
}
