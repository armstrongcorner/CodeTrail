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
    func login(username: String, password: String) async throws -> AuthModel?
}

//actor LoginService: LoginServiceProtocol {
//    private let apiClient: ApiClientProtocol
//
//    init(apiClient: ApiClientProtocol = ApiClient()) {
//        self.apiClient = apiClient
//    }
//
//    func login(username: String, password: String) async throws -> AuthModel? {
//        let httpBody = try JSONEncoder().encode(LoginRequest(username: username, password: password))
//        let authModel = try await apiClient.post(url: URL(string: "login_url")!, body: httpBody, responseType: AuthModel?.self)
//
//        return authModel
//    }
//}

actor LoginService: LoginServiceProtocol {
    func login(username: String, password: String) async throws -> AuthModel? {
        guard let url = URL(string: "login_url") else {
            throw URLError(.badURL)
        }
        
        let body = try JSONEncoder().encode(LoginRequest(username: username, password: password))
        
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.httpBody = body
        req.timeoutInterval = 120
        
        let (resp, data) = try await URLSession.shared.data(for: req)
        
        return nil
    }
}
