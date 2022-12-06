//
//  ImageCacheType.swift
//  Employee Directory
//
//  Created by Smetak,Libby on 12/6/22.
//

import Foundation
import UIKit

/// With help from https://medium.com/@mshcheglov/reusable-image-cache-in-swift-9b90eb338e8d
/// Declares in-memory image cache.
protocol ImageCacheType: AnyObject {
    /// Returns the image associated with a given url
    func image(for url: URL) -> UIImage?
    /// Inserts the image of the specified url in the cache
    func insertImage(_ image: UIImage?, for url: URL)
    /// Removes the image of the specified url in the cache
    func removeImage(for url: URL)
    /// Accesses the value associated with the given key for reading and writing
    subscript(_ url: URL) -> UIImage? { get set }
}
