//
//  MockLoginService.swift
//  CodeTestForIView
//
//  Created by Armstrong Liu on 02/03/2025.
//

import Foundation

actor MockLoginService: LoginServiceProtocol {
    var authResponse: AuthResponse?
    var shouldReturnError: Bool?
    var error: LoginError?
    
    func setAuthResponse(_ value: AuthResponse?) {
        self.authResponse = value
    }
    
    func setShouldReturnError(_ value: Bool?) {
        self.shouldReturnError = value
    }
    
    func setError(_ value: LoginError?) {
        self.error = value
    }
    
    func login(username: String, password: String) async throws -> AuthResponse? {
        // Mock waiting for api call result
        try await Task.sleep(nanoseconds: 3 * 1_000_000_000)
        
        if let shouldReturnError = shouldReturnError, !shouldReturnError, let authResponse = authResponse, error == nil {
            // Success
            return authResponse
        } else if let error = error {
            // Throw some error
            throw error
        } else {
            // Unknown error
            throw LoginError.unknown
        }
    }
}
