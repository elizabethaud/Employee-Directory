//
//  ContentView.swift
//  Employee Directory
//
//  Created by Smetak,Libby on 12/1/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            DirectoryView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
