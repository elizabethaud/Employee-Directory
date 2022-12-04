//
//  DirectoryViewModel.swift
//  Employee Directory
//
//  Created by Smetak,Libby on 12/1/22.
//

import Foundation

/// View model for Employee Directory content page.
class DirectoryViewModel: ObservableObject {
    /// All employees to be displayed on the page.
    @Published var employees: [Employee]
    
    /// Service that gets Employees.
    let contentService = ContentService()
    
    /// Upon initialization, get employees and populate the view model.
    init() {
        self.employees = []
        contentService.getEmployees(completionHandler: { result in
            switch result {
            case .success(let employees):
                self.employees = employees
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
