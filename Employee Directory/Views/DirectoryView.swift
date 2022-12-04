//
//  DirectoryView.swift
//  Employee Directory
//
//  Created by Smetak,Libby on 12/4/22.
//

import SwiftUI

/// View that holds all of the Employees in the directory.
struct DirectoryView: View {
    @StateObject var viewModel = DirectoryViewModel()
    
    var body: some View {
        VStack {
            ForEach(viewModel.employees) { employee in
                Text(employee.fullName)
                Text(employee.emailAddress)
                Divider()
            }
        }
        .padding()
    }
}

struct DirectoryView_Previews: PreviewProvider {
    static var previews: some View {
        DirectoryView()
    }
}
