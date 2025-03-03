//
//  MockFileService.swift
//  CodeTestForIView
//
//  Created by Armstrong Liu on 02/03/2025.
//

import Foundation

actor MockFileService: FileServiceProtocol {
    var localFileData: Data?
    var shouldReturnError: Bool?
    var error: String?
    
    func getLocalFile(fileName: String) async throws -> Data? {
        return nil
    }
}
