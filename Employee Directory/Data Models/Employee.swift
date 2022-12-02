//
//  Employee.swift
//  Employee Directory
//
//  Created by Smetak,Libby on 12/1/22.
//

import Foundation

enum EmployeeType: Codable {
    case FULL_TIME
    case PART_TIME
    case CONTRACTOR
}

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
}
