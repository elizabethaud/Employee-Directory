//
//  EmployeeDataModelTests.swift
//  Employee DirectoryTests
//
//  Created by Smetak,Libby on 12/5/22.
//

import XCTest

final class EmployeeDataModelTests: XCTestCase {
    func setUpEmployees() -> [Employee] {
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
    
    func testDecodeEmployee() {
        let employee = setUpEmployees()[0]
        XCTAssertEqual(employee.fullName, "Justine Mason")
        XCTAssertEqual(employee.phoneNumber, "5553280123")
        XCTAssertEqual(employee.emailAddress, "jmason.demo@squareup.com")
        XCTAssertEqual(employee.employeeType, .FULL_TIME)
    }
    
    func testFormattedPhoneNumber() {
        let employee = setUpEmployees()[0]
        XCTAssertEqual(employee.phoneNumber, "5553280123")
        XCTAssertEqual(employee.formattedPhoneNumber(), "(555) 328 - 0123")
    }
    
    func testFormattedEmployeeType() {
        let employees = setUpEmployees()
        let employeeOne = employees[0]
        XCTAssertEqual(employeeOne.employeeType, .FULL_TIME)
        XCTAssertEqual(employeeOne.formattedEmployeeType(), "FULL TIME")
        
        let employeeTwo = employees[9]
        XCTAssertEqual(employeeTwo.employeeType, .CONTRACTOR)
        XCTAssertEqual(employeeTwo.formattedEmployeeType(), "CONTRACTOR")
    }
}
