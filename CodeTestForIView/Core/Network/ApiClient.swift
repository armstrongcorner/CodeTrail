//
//  ApiClient.swift
//  TddCodeTest
//
//  Created by Armstrong Liu on 01/03/2025.
//

import Foundation

protocol ApiClientProtocol: Sendable {
    func get<T: Decodable>(url: URL, header: [String : String], body: Data?, responseType: T.Type) async throws -> T
    func post<T: Decodable>(url: URL, header: [String : String], body: Data?, responseType: T.Type) async throws -> T
}

extension ApiClientProtocol {
    func get<T: Decodable>(url: URL, header: [String : String] = [:], body: Data?, responseType: T.Type) async throws -> T { 
        try await get(url: url, header: header, body: body, responseType: responseType)
    }
    
    func post<T: Decodable>(url: URL, header: [String : String] = [:], body: Data?, responseType: T.Type) async throws -> T {
        try await post(url: url, header: header, body: body, responseType: responseType)
    }
}

final class ApiClient: ApiClientProtocol {
    private func getHeaders() -> [String : String] {
        return [:]
    }
    
    private func sendRequest<T: Decodable>(
        url: URL,
        method: String,
        headers: [String : String]?,
        body: Data?,
        responseType: T.Type
    ) async throws -> T {
        var req = URLRequest(url: url)
        req.httpMethod = method
        req.httpBody = body
        // Set default headers
        let defaultHeaders = getHeaders()
        defaultHeaders.forEach { key, value in
            req.setValue(value, forHTTPHeaderField: key)
        }
        // Set custom headers
        headers?.forEach({ key, value in
            req.setValue(value, forHTTPHeaderField: key)
        })
        
        let (data, resp) = try await URLSession.shared.data(for: req)
        
        guard let resp = resp as? HTTPURLResponse, resp.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decodedResp = try JSONDecoder().decode(responseType, from: data)
        return decodedResp
    }
    
    func get<T: Decodable>(
        url: URL,
        header: [String : String] = [:],
        body: Data?,
        responseType: T.Type
    ) async throws -> T {
        return try await sendRequest(url: url, method: "GET", headers: [:], body: body, responseType: responseType)
    }
    
    func post<T: Decodable>(
        url: URL,
        header: [String : String] = [:],
        body: Data?,
        responseType: T.Type
    ) async throws -> T {
        return try await sendRequest(url: url, method: "POST", headers: [:], body: body, responseType: responseType)
    }
}
