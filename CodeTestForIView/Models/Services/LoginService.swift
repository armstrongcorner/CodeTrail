//
//  LoginService.swift
//  CodeTestForIView
//
//  Created by Armstrong Liu on 02/03/2025.
//

import Foundation


struct LoginRequest: Codable {
    let username: String
    let password: String
}

protocol LoginServiceProtocol: Sendable {
    func login(username: String, password: String) async throws -> AuthResponse?
}

actor LoginService: LoginServiceProtocol {
    private let apiClient: ApiClientProtocol

    init(apiClient: ApiClientProtocol = ApiClient()) {
        self.apiClient = apiClient
    }

    func login(username: String, password: String) async throws -> AuthResponse? {
        let loginRequest = LoginRequest(username: username, password: password)
        let authResponse = try await apiClient.post(urlString: "login_url", headers: nil, body: loginRequest, responseType: AuthResponse.self)
        return authResponse
    }
}
