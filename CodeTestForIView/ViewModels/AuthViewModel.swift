//
//  AuthViewModel.swift
//  CodeTestForIView
//
//  Created by Armstrong Liu on 02/03/2025.
//

import Foundation

enum LoginState {
    case none
    case success
    case failure
}

enum LoginError: Error {
    case emptyUsername
    case emptyPassword
    case invalidCredentials
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .emptyUsername:
            return "Empty username error"
        case .emptyPassword:
            return "Empty password error"
        case .invalidCredentials:
            return "Invalid login credentials"
        case .unknown:
            return "Unknown error"
        }
    }
}

@MainActor
@Observable
final class AuthViewModel {
    var username: String = ""
    var password: String = ""
    var loginState: LoginState = .none
    var errMsg: String?
    
    @ObservationIgnored
    private let loginService: LoginServiceProtocol
    
    init(loginService: LoginServiceProtocol = LoginService()) {
        self.loginService = loginService
    }
    
    func login() async {
        // Validate username cannot be empty
        guard !username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            loginState = .failure
            errMsg = LoginError.emptyUsername.errorDescription
            print("errMsg: \(errMsg ?? "")")
            return
        }
        
        // Validate password cannot be empty
        guard !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            loginState = .failure
            errMsg = LoginError.emptyPassword.errorDescription
            print("errMsg: \(errMsg ?? "")")
            return
        }
        
        // Call login service
        do {
            let auth = try await loginService.login(username: username, password: password)
            
            if auth != nil {
                loginState = .success
                errMsg = nil
            } else {
                loginState = .failure
                errMsg = LoginError.unknown.errorDescription
                print("errMsg: \(errMsg ?? "")")
            }
        } catch {
            loginState = .failure
            
            switch error {
            case LoginError.invalidCredentials:
                errMsg = LoginError.invalidCredentials.errorDescription
            case LoginError.unknown:
                errMsg = LoginError.unknown.errorDescription
            default:
                errMsg = error.localizedDescription
            }
            print("errMsg: \(errMsg ?? "")")
        }
    }
}
