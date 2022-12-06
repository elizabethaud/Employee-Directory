//
//  DirectoryDataModelTests.swift
//  Employee DirectoryTests
//
//  Created by Smetak,Libby on 12/5/22.
//

import XCTest

final class DirectoryDataModelTests: XCTestCase {
    func setUpFullEmployees() -> [Employee] {
        guard let jsonData = EmployeeJsonData.employeesJson.data(using: .utf8) else {
            XCTFail("Failed to construct json data.")
            return []
        }
        
        var employeeContainer = EmployeeContainer(employees: [])
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            employeeContainer = try decoder.decode(EmployeeContainer.self, from: jsonData)
        } catch {
            print(error)
            XCTFail("Could not decode employees.")
            return []
        }
        
        return employeeContainer.employees
    }
    
    func setUpEmptyEmployees() -> [Employee] {
        guard let jsonData = EmployeeJsonData.emptyEmployeesJson.data(using: .utf8) else {
            XCTFail("Failed to construct json data.")
            return []
        }
        
        var employeeContainer = EmployeeContainer(employees: [])
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            employeeContainer = try decoder.decode(EmployeeContainer.self, from: jsonData)
        } catch {
            print(error)
            XCTFail("Could not decode employees.")
            return []
        }
        
        return employeeContainer.employees
    }
    
    func testDirectoryDataModel() {
        let employees = setUpFullEmployees()
        let directory = Directory(employees: employees)
        
        XCTAssertEqual(directory.teamDirectories.count, 10)
        let employeeOne = directory.teamDirectories[0].employees[0]
        XCTAssertEqual(employeeOne.fullName, "Justine Mason")
        XCTAssertEqual(employeeOne.phoneNumber, "5553280123")
        XCTAssertEqual(employeeOne.emailAddress, "jmason.demo@squareup.com")
        XCTAssertEqual(employeeOne.employeeType, .FULL_TIME)
        
        let employeeTwo = directory.teamDirectories[9].employees[0]
        XCTAssertEqual(employeeTwo.fullName, "Jack Dorsey")
        XCTAssertEqual(employeeTwo.phoneNumber, "5554544932")
        XCTAssertEqual(employeeTwo.emailAddress, "jdorsey.demo@squareup.com")
        XCTAssertEqual(employeeTwo.employeeType, .FULL_TIME)
    }
    
    func testEmptyDirectoryDataModel() {
        let employees = setUpEmptyEmployees()
        let directory = Directory(employees: employees)
        
        XCTAssertTrue(directory.teamDirectories.isEmpty)
    }
}
