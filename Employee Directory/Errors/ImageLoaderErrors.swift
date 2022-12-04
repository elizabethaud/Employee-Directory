//
//  ImageLoaderErrors.swift
//  Employee Directory
//
//  Created by Smetak,Libby on 12/4/22.
//

import Foundation

/// Errors thrown by ImageLoader
enum ImageLoaderError: Error {
    case urlNotSupported
}

/// Adds localizedDescription.
extension ImageLoaderError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .urlNotSupported:
            return "URL not supported."
        }
    }
}
