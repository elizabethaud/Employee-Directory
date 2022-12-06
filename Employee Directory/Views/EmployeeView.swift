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
    /// The employee to be shown.
    let employee: Employee
    
    /// The employee's profile photo.
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
        HStack {
            asyncImage
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(20)
                .padding(8)
            VStack(alignment: .leading) {
                Text(employee.fullName).font(.system(size: 10)).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(employee.formattedEmployeeType()).font(.system(size: 10))
                Text(employee.emailAddress).font(.system(size: 10))
                Text(employee.formattedPhoneNumber()).font(.system(size: 10))
                    .padding(.bottom, 8)
                Text(employee.biography).font(.system(size: 10))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.trailing, 8)
        }
        .overlay(RoundedRectangle(cornerRadius: 25)
            .stroke(Color.gray, lineWidth: 0.5))
        .padding([.leading, .trailing], 8)
    }
}
