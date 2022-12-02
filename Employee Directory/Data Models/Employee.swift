//
//  Employee.swift
//  Employee Directory
//
//  Created by Smetak,Libby on 12/1/22.
//

import Foundation

struct Employee: Codable, Identifiable {
    let id = UUID()
    let name = "Some name"
}
