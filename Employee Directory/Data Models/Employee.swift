//
//  Employee.swift
//  Employee Directory
//
//  Created by Smetak,Libby on 12/1/22.
//

import Foundation

/// Enum representing employeeType, a member variable of Employee.
enum EmployeeType: String, Codable {
    case FULL_TIME
    case PART_TIME
    case CONTRACTOR
}

/// Encapsulating a list of employees to mimic server's data structure for decoding a list of employees.
struct EmployeeContainer: Codable {
    let employees: [Employee]
}

/// Employee data structure. Inherits from Identifiable so it can be looped over in the SwiftUI view.
struct Employee: Codable, Identifiable {
    let id = UUID()
    let uuid: String
    let fullName: String
    let phoneNumber: String
    let emailAddress: String
    let biography: String
    let photoUrlSmall: String
    let photoUrlLarge: String
    let team: String
    let employeeType: EmployeeType
    
    init() {
        self.uuid = "123"
        self.fullName = "Elizabeth Aud"
        self.phoneNumber = "2817555037"
        self.emailAddress = "elizabethaud@outlook.com"
        self.biography = "some bio"
        self.photoUrlSmall = "some photo"
        self.photoUrlLarge = "some other photo"
        self.team = "Queso"
        self.employeeType = .FULL_TIME
    }
    
    // Format phone number to legable mask.
    // https://stackoverflow.com/questions/32364055/formatting-phone-number-in-swift
    func formattedPhoneNumber() -> String {
        let mask = "(XXX) - XXX - XXXX"
        let numbers = phoneNumber.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    // Format employee type to legable string.
    func formattedEmployeeType() -> String {
        var result = ""
        
        for ch in employeeType.rawValue {
            if ch == "_" {
                result.append(" ")
            } else {
                result.append(ch)
            }
        }
        
        return result
    }
    
}
