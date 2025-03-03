//
//  MockDownloadService.swift
//  CodeTestForIView
//
//  Created by Armstrong Liu on 02/03/2025.
//

import Foundation

actor MockDownloadService: DownloadServiceProtocol {
    var downloadedFileData: Data?
    var shouldReturnError: Bool?
    var error: String?
    
    func donwloadFile(url: String) async throws -> Data? {
        return nil
    }
}
