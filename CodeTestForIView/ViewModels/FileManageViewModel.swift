//
//  FileManageViewModel.swift
//  CodeTestForIView
//
//  Created by Armstrong Liu on 02/03/2025.
//

import Foundation

@MainActor
@Observable
final class FileManageViewModel {
    var url: String?
    var fileName: String?
    var errMsg: String?
    
    @ObservationIgnored
    private let downloadService: DownloadServiceProtocol?
    @ObservationIgnored
    private let fileService: FileServiceProtocol?
    
    init(
        downloadService: DownloadServiceProtocol = DownloadService(),
        fileService: FileServiceProtocol = FileService()
    ) {
        self.downloadService = downloadService
        self.fileService = fileService
    }
    
    func getFile(isLocalFile: Bool = false) async -> FileModel? {
//        do {
//            if (!isLocalFile) {
//                // Download
//                guard let url = url else {
//                    throw URLError(.badURL)
//                }
//                try await downloadService?.donwloadFile(url: <#T##String#>)
//            } else {
//                // Local file
//            }
//        } catch {
//            
//        }
        
        return nil
    }
}
