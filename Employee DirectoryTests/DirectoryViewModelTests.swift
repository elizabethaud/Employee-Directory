//
//  DirectoryViewModelTests.swift
//  Employee DirectoryTests
//
//  Created by Smetak,Libby on 12/5/22.
//

import XCTest

final class DirectoryViewModelTests: XCTestCase {
    func testDirectoryViewModelWithSuccessfulContentService() {
        let viewModel = DirectoryViewModel(contentService: SuccessfulContentServiceFake())
        let employee = viewModel.directory.teamDirectories[0].employees[0]
        XCTAssertEqual(employee.fullName, "Justine Mason")
        XCTAssertEqual(employee.phoneNumber, "5553280123")
        XCTAssertEqual(employee.emailAddress, "jmason.demo@squareup.com")
        XCTAssertEqual(employee.employeeType, .FULL_TIME)
    }
    
    func testDirectoryViewModelWithEmptyContentService() {
        let viewModel = DirectoryViewModel(contentService: EmptyContentServiceFake())
        XCTAssertTrue(viewModel.directory.teamDirectories.isEmpty)
    }
    
    func testDirectoryViewModelWithMalformedContentService() {
        let viewModel = DirectoryViewModel(contentService: MalformedContentServiceFake())
        XCTAssertTrue(viewModel.directory.teamDirectories.isEmpty)
    }
}
