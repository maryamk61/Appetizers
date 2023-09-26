//
//  ImageCache.swift
//  Appetizers
//
//  Created by Maryam Kaveh on 6/23/1402 AP.
//

import Foundation
import UIKit

class ImageCache {
    
    private static var imageCache = ImageCache()
    static func getImageCache() -> ImageCache {
        return imageCache
    }
    
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey: String) -> UIImage? {
        guard !forKey.isEmpty else {return nil}
        return cache.object(forKey: forKey as NSString)
    }
    
    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: forKey as NSString)
    }
}
