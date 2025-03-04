//
//  BaseResponse.swift
//  CodeTestForIView
//
//  Created by Armstrong Liu on 04/03/2025.
//

import Foundation

struct BaseResponse<T: Codable & Sendable>: Codable & Sendable  {
    let data: T?
    let isSuccess: Bool?
    let errorMessage: String?
}
