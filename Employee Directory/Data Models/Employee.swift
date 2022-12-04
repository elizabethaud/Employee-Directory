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
}
