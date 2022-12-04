//
//  Errors.swift
//  Employee Directory
//
//  Created by Smetak,Libby on 12/2/22.
//

import Foundation

/// Errors thrown by Content Service.
enum ContentServiceError: Error {
    case urlNotSupported
    case requestError
    case doesNotConformToHTTPResponse
    case statusCodeNot200
    case noData
}

/// Adds localizedDescription.
extension ContentServiceError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .urlNotSupported:
            return "URL not supported."
        case .requestError:
            return "Request error."
        case .doesNotConformToHTTPResponse:
            return "Does not conform to http response."
        case .statusCodeNot200:
            return "Status code was not 200."
        case .noData:
            return "No data came back with request."
        }
    }
}
