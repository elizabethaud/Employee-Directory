//
//  EmployeeView.swift
//  Employee Directory
//
//  Created by Smetak,Libby on 12/4/22.
//

import Foundation
import SwiftUI

struct EmployeeView: View {
    let employee: Employee
    let asyncImage: AsyncImage?
    
    init(employee: Employee) {
        self.employee = employee
        do {
            let asyncImage = try AsyncImage(urlString: employee.photoUrlSmall)
            self.asyncImage = asyncImage
        } catch {
            print(error.localizedDescription)
            self.asyncImage = nil
        }
    }
    
    var body: some View {
        VStack {
            asyncImage
            Text(employee.fullName)
            Text(employee.emailAddress)
        }
    }
}
