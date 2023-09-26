//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Maryam Kaveh on 6/22/1402 AP.
//

import Foundation
import Alamofire
import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    static let baseUrl = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals"
    let appetizersUrl = baseUrl + "/appetizers"
    
    let imageCache = ImageCache.getImageCache()
    
    private init() {}
    
//    func getAppetizers(completion: @escaping (Result<[Appetizer], AppetizerError>) -> Void) {
//        guard let url = URL(string: appetizersUrl) else {
//            completion(.failure(.invalidUrl))
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
//            if let error = error {
//                print(error.localizedDescription)
//                completion(.failure(.unableToComplete))
//                return
//            }
//            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
//                completion(.failure(.badResponse))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(.invalidData))
//                return
//            }
//
//            do {
//                let decodedResult = try JSONDecoder().decode(AppetizerResponse.self, from: data)
//                completion(.success(decodedResult.request))
//            } catch {
//               print(error)
//                completion(.failure(.invalidData))
//            }
//        }
//
//        task.resume()
//    }
//
    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: appetizersUrl) else {
            throw AppetizerError.invalidUrl
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decodedResult = try JSONDecoder().decode(AppetizerResponse.self, from: data)
            return decodedResult.request
        } catch {
            throw AppetizerError.invalidData
        }
    }

    func downloadImageWithCaching(from: String, completion: @escaping (UIImage?) -> Void) {

        if imageCache.get(forKey: from) != nil {
            let image = imageCache.get(forKey: from)
            completion(image)
            return
        }

        guard let url = URL(string: from) else {
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            // we don't care about error here
//            if let error = error {
//                completion(nil)
//                return
//            }
//            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
//                return
//            }
//
            guard let data , let resultImage = UIImage(data: data) else {
                completion(nil)
                return
            }

            self.imageCache.set(forKey: from, image: resultImage)
            completion(resultImage)
        }
        task.resume()
    }
    
}
