//
//  FileManageViewModelTest.swift
//  CodeTestForIViewTests
//
//  Created by Armstrong Liu on 02/03/2025.
//

import XCTest
@testable import CodeTestForIView

@MainActor
final class FileManageViewModelTest: XCTestCase {
    var sut: FileManageViewModel?
    var mockFileService: MockFileService?
    var mockDownloadService: MockDownloadService?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        mockFileService = MockFileService()
        mockDownloadService = MockDownloadService()
        sut = FileManageViewModel(downloadService: mockDownloadService!, fileService: mockFileService!)
    }

    override func tearDownWithError() throws {
        mockFileService = nil
        mockDownloadService = nil
        sut = nil
        
        try super.tearDownWithError()
    }

    func testGetLocalFileSuccess() async throws {
        // Given
        // When
        let fileModel = await sut?.getFile(isLocalFile: true)
        
        // Then
    }
}
