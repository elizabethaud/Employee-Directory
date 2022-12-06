//
//  ContentServiceTestErrors.swift
//  Employee DirectoryTests
//
//  Created by Smetak,Libby on 12/6/22.
//

import Foundation

enum ContentServiceTestError: Error {
    case failedToConstructJsonData
    case failedToDecodeEmployees
}

extension ContentServiceTestError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .failedToConstructJsonData:
            return "Failed to construct json data."
        case .failedToDecodeEmployees:
            return "Failed to decode employees."
        }
    }
}
