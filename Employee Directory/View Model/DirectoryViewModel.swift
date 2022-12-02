//
//  DirectoryViewModel.swift
//  Employee Directory
//
//  Created by Smetak,Libby on 12/1/22.
//

import Foundation

class DirectoryViewModel: ObservableObject {
    @Published var employees: [Employee]
    
    init() {
        self.employees = [Employee(), Employee(), Employee()]
    }
}
