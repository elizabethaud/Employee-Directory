//
//  Directory.swift
//  Employee Directory
//
//  Created by Smetak,Libby on 12/5/22.
//

import Foundation

struct TeamDirectory: Identifiable {
    let id = UUID()
    let team: String
    var employees: [Employee]
    
    init(team: String, employees: [Employee]) {
        self.team = team
        self.employees = employees
    }
}

struct Directory {
    var teamDirectories = [TeamDirectory]()
    
    init(employees: [Employee]) {
        for employee in employees {
            if let teamIndex = teamDirectories.firstIndex(where: { $0.team == employee.team }) {
                teamDirectories[teamIndex].employees.append(employee)
            } else {
                teamDirectories.append(TeamDirectory(team: employee.team, employees: [employee]))
            }
        }
    }
}
