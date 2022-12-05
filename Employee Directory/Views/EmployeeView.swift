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
    
    // Format phone number to legable mask.
    // https://stackoverflow.com/questions/32364055/formatting-phone-number-in-swift
    func formatPhoneNumber(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
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
    
    func formatEmployeeType(type: String) -> String {
        var result = ""
        
        for ch in type {
            if ch == "_" {
                result.append(" ")
            } else {
                result.append(ch)
            }
        }
        
        return result
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
                Text(formatEmployeeType(type: employee.employeeType.rawValue)).font(.system(size: 10))
                Text(employee.emailAddress).font(.system(size: 10))
                Text(formatPhoneNumber(with: "(XXX) - XXX - XXXX", phone: employee.phoneNumber)).font(.system(size: 10))
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
