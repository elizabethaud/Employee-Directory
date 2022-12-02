//
//  DirectoryViewModel.swift
//  Employee Directory
//
//  Created by Smetak,Libby on 12/1/22.
//

import Foundation

class DirectoryViewModel: ObservableObject {
    @Published var employees: [Employee]
    let contentService = ContentService()
    
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
