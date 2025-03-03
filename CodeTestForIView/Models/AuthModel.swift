//
//  AuthModel.swift
//  CodeTestForIView
//
//  Created by Armstrong Liu on 02/03/2025.
//

import Foundation

struct AuthModel: Codable {
    let token: String?
    let validUntilTimestamp: Int?
}
