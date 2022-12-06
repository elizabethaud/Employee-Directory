//
//  ImageCache.swift
//  Employee Directory
//
//  Created by Smetak,Libby on 12/6/22.
//

import Foundation
import UIKit


/// WIth help from this swift blog: https://medium.com/@mshcheglov/reusable-image-cache-in-swift-9b90eb338e8d
/// Caches images.
final class ImageCache {
    /// Contains decoded images
    private lazy var decodedImageCache: NSCache<AnyObject, AnyObject> = {
        let cache = NSCache<AnyObject, AnyObject>()
        cache.totalCostLimit = config.memoryLimit
        return cache
    }()
    
    private let config: Config
    
    struct Config {
        let countLimit: Int
        let memoryLimit: Int
        
        static let defaultConfig = Config(countLimit: 100, memoryLimit: 1024*1024*100)
    }
    
    init(config: Config = Config.defaultConfig) {
        self.config = config
    }
}

extension ImageCache: ImageCacheType {
    func insertImage(_ image: UIImage?, for url: URL) {
        guard let image = image else { return removeImage(for: url) }
        decodedImageCache.setObject(image as AnyObject, forKey: url as AnyObject)
    }

    func image(for url: URL) -> UIImage? {
        if let decodedImage = decodedImageCache.object(forKey: url as AnyObject) as? UIImage {
            return decodedImage
        }
        return nil
    }
    
    func removeImage(for url: URL) {
        decodedImageCache.removeObject(forKey: url as AnyObject)
    }
    
    subscript(_ key: URL) -> UIImage? {
        get {
            return image(for: key)
        }
        set {
            return insertImage(newValue, for: key)
        }
    }
}
