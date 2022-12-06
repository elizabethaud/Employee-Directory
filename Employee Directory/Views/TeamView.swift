//
//  TeamView.swift
//  Employee Directory
//
//  Created by Smetak,Libby on 12/5/22.
//

import Foundation

import SwiftUI

/// View that holds all of the Employees in a team.
struct TeamView: View {
    /// List of employees in the team.
    let employees: [Employee]
    
    init(employees: [Employee]) {
        self.employees = employees
    }
    
    var body: some View {
        VStack {
            ForEach(employees) { employee in
                EmployeeView(employee: employee)
            }
        }.padding([.top, .bottom], 5)
    }
}
