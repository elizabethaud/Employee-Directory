//
//  Errors.swift
//  Employee Directory
//
//  Created by Smetak,Libby on 12/2/22.
//

import Foundation

enum ContentServiceError: Error {
    case URLNotSupported
    case RequestError
}

extension ContentServiceError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .URLNotSupported:
            return "URL not supported."
        case .RequestError:
            return "Request error."
        }
    }
}
