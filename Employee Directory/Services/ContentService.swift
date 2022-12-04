//
//  ContentService.swift
//  Employee Directory
//
//  Created by Smetak,Libby on 12/1/22.
//

import Foundation

/// Service used to get employee data from aws server.
class ContentService {
    /// Get employee data from aws server.
    func getEmployees(completionHandler: @escaping (Result<[Employee], Error>) -> Void) {
        guard let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees.json") else {
            completionHandler(.failure(ContentServiceError.urlNotSupported))
            return
        }
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                completionHandler(.failure(ContentServiceError.requestError))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completionHandler(.failure(ContentServiceError.doesNotConformToHTTPResponse))
                return
            }
            
            if response.statusCode == 200 {
                guard let data = data else {
                    completionHandler(.failure(ContentServiceError.noData))
                    return
                }
                DispatchQueue.main.async {
                    do {
                        let decodedEmployees = try self.decodeEmployees(data: data)
                        completionHandler(.success(decodedEmployees))
                    } catch let error {
                        print(error)
                        completionHandler(.failure(error))
                    }
                }
                
            } else {
                completionHandler(.failure(ContentServiceError.statusCodeNot200))
            }
        }
        
        dataTask.resume()
    }
    
    /// Decode a list of employees.
    func decodeEmployees(data: Data) throws -> [Employee] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedEmployeeContainer = try decoder.decode(EmployeeContainer.self, from: data)
        return decodedEmployeeContainer.employees
    }
}
