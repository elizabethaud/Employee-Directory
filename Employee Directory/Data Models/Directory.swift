//
//  Directory.swift
//  Employee Directory
//
//  Created by Smetak,Libby on 12/5/22.
//

import Foundation

struct Directory {
    var directory = Dictionary<String, [Employee]>()
    
    init(employees: [Employee]) {
        for employee in employees {
            guard var entry = directory[employee.team] else {
                directory[employee.team] = [employee]
                return
            }
            entry.append(employee)
        }
    }
}
