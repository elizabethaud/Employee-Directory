//
//  ImageLoader.swift
//  Employee Directory
//
//  Created by Smetak,Libby on 12/4/22.
//

import SwiftUI
import Combine
import Foundation

/// Loads an image.
/// Credit to this swift blog: https://www.vadimbulavin.com/asynchronous-swiftui-image-loading-from-url-with-combine-and-swift/
class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let cache = ImageCache()
    private let url: URL
    private var cancellable: AnyCancellable?
    
    init(url: URL) {
        self.url = url
    }
    
    deinit {
        cancel()
    }
    
    func load() {
        if let image = cache[url]{
            self.image = image
        }
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.image = $0
                guard let url = self?.url else { return }
                self?.cache[url] = $0
            }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
