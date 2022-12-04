//
//  AsyncImage.swift
//  Employee Directory
//
//  Created by Smetak,Libby on 12/4/22.
//

import Foundation
import SwiftUI

/// View that holds an image or a palceholder.
struct AsyncImage: View {
    @StateObject private var loader: ImageLoader
    
    init(urlString: String) throws {
        guard let url = URL(string: urlString) else {
            throw ImageLoaderError.urlNotSupported
        }
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View {
        content
            .onAppear(perform: loader.load)
    }
    
    private var content: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
            } else {
                Text("Loading...")
            }
        }
    }
}
