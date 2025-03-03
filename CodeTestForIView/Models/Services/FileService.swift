//
//  FileService.swift
//  CodeTestForIView
//
//  Created by Armstrong Liu on 02/03/2025.
//

import Foundation

protocol FileServiceProtocol {
    func getLocalFile(fileName: String) async throws -> Data?
}

actor FileService: FileServiceProtocol {
    func getLocalFile(fileName: String) async throws -> Data? {
        // TODO: implement the logic later
        return nil
    }
}
