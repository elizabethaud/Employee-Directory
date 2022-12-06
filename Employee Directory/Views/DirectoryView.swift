//
//  DirectoryView.swift
//  Employee Directory
//
//  Created by Smetak,Libby on 12/4/22.
//

import SwiftUI

/// View that holds the entire directory - all teams and employees within teams.
struct DirectoryView: View {
    /// View model containing the entire directory.
    @StateObject var viewModel = DirectoryViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(viewModel.directory.teamDirectories) { teamDirectory in
                Text(teamDirectory.team)
                TeamView(employees: teamDirectory.employees)
            }
        }
        .padding()
        .refreshable {
            viewModel.refreshDirectory()
        }
    }
}

struct DirectoryView_Previews: PreviewProvider {
    static var previews: some View {
        DirectoryView()
    }
}
