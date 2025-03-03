//
//  DownloadService.swift
//  CodeTestForIView
//
//  Created by Armstrong Liu on 02/03/2025.
//

import Foundation

protocol DownloadServiceProtocol {
    func donwloadFile(url: String) async throws -> Data?
}

actor DownloadService: DownloadServiceProtocol {
    func donwloadFile(url: String) async throws -> Data? {
        // TODO: implement the logic later
        return nil
    }
}
