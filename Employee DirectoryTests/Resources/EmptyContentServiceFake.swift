//
//  EmptyContentServiceFake.swift
//  Employee DirectoryTests
//
//  Created by Smetak,Libby on 12/6/22.
//

import Foundation

class EmptyContentServiceFake: ContentNetworkService {
    func getEmployees(completionHandler: @escaping (Result<[Employee], Error>) -> Void) {
        guard let jsonData = EmployeeJsonData.emptyEmployeesJson.data(using: .utf8) else {
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
