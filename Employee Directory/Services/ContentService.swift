//
//  ContentService.swift
//  Employee Directory
//
//  Created by Smetak,Libby on 12/1/22.
//

import Foundation

class ContentService {
    func getEmployees(completionHandler: @escaping (Result<[Employee], Error>) -> Void) {
        guard let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees.json") else {
            completionHandler(.failure(ContentServiceError.URLNotSupported))
            return
        }
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(ContentServiceError.RequestError))
                return
            }
        }
        
        
        completionHandler(.success([Employee(), Employee(), Employee()]))
    }
}
