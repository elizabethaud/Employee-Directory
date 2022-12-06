//
//  SuccessfulContentServiceFake.swift
//  Employee DirectoryTests
//
//  Created by Smetak,Libby on 12/6/22.
//

import Foundation

class SuccessfulContentServiceFake: ContentNetworkService {
    func getEmployees(completionHandler: @escaping (Result<[Employee], Error>) -> Void) {
        guard let jsonData = EmployeeJsonData.employeesJson.data(using: .utf8) else {
            completionHandler(.failure(ContentServiceTestError.failedToConstructJsonData))
            return
        }
        
        var employeeContainer = EmployeeContainer(employees: [])
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            employeeContainer = try decoder.decode(EmployeeContainer.self, from: jsonData)
        } catch {
            completionHandler(.failure(ContentServiceTestError.failedToDecodeEmployees))
            return
        }
        
        return completionHandler(.success(employeeContainer.employees))
    }
}
