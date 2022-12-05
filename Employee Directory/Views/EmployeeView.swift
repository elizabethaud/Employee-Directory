//
//  EmployeeView.swift
//  Employee Directory
//
//  Created by Smetak,Libby on 12/4/22.
//

import Foundation
import SwiftUI

/// View of an individual employee.
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
        HStack(spacing: 5) {
            asyncImage
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(20)
                .padding()
            VStack(alignment: .leading) {
                Text(employee.fullName).font(.system(size: 16))
                Text(employee.emailAddress).font(.system(size: 16))
            }
            .padding(.trailing, 8)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.purple, lineWidth: 2))
        //.border(Color.purple, width: 5)
        //.cornerRadius(20)
    }
}
