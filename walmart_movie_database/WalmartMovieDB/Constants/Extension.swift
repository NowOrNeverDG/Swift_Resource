//
//  Extension.swift
//  WalmartMovieDB
//
//  Created by Ge Ding on 12/16/21.
//

import Foundation
import UIKit
class ImageDownloader {
    static let shared = ImageDownloader()
    private init() {}
    let imageCache = NSCache<NSString, UIImage>()

    func getImage(url: String?, completion:@escaping (UIImage) -> ()) {
        guard let url = url else {
            completion(UIImage(named: "template")!)
            return
        }

        if let cached = imageCache.object(forKey: url as NSString) {
            completion(cached)
        }

        DispatchQueue.global(qos: .background).async {
            if let dataUrl = URL(string: url) {
                do {
                    let data = try Data(contentsOf: dataUrl)
                    if let image = UIImage(data: data) {
                        self.imageCache.setObject(image, forKey: url as NSString)
                        completion(image)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            } else {
                completion(UIImage(named: "template")!)
            }
        }
    }
}
