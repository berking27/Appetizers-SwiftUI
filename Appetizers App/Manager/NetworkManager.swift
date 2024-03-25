//
//  NetworkManager.swift
//  Appetizers App
//
//  Created by Berkin KOCA on 13.03.2024.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    func getAppetizers() async throws -> [Appetizer] {
        ///Check if url valid
        guard let url = URL(string: appetizerURL) else { throw APError.invalidURL}
        
        /// Handle error tasks, Tuple returns a tuple that is not optional
        let (data, response) = try await URLSession.shared.data(from: url)
        
        ///Check if response valid
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(AppetizerResponse.self, from: data).request
        } catch {
            throw APError.invalidData
        }
    }
    
    func downloadImage(fromUrlString urlString: String, completion: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, _ in
            
            guard let data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completion(image)
        }
        
        task.resume()
    }
    
    
    
    //    func downloadImage(fromUrlString urlString: String) async -> UIImage? {
    //        let cacheKey = NSString(string: urlString)
    //
    //        if let image = cache.object(forKey: cacheKey) { return image }
    //
    //        guard let url = URL(string: urlString) else { return nil }
    //
    //        do {
    //            let (data, _) = try await URLSession.shared.data(from: url)
    //            guard let image = UIImage(data: data) else { return nil }
    //            return image
    //
    //        } catch {
    //            return nil
    //        }
    //    }
}




//MARK: - Old Network Calls (Result Type and completion)


//    func getAppetizers(completion: @escaping (Result<[Appetizer], APError>) -> Void) {
//        guard let url = URL(string: appetizerURL) else {
//            completion(.failure(.invalidURL))
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
//
//            if let _ = error {
//                completion(.failure(.unableToComplete))
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completion(.failure(.invalidResponse))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(.invalidData))
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
//                completion(.success(decodedResponse.request))
//            } catch {
//                completion(.failure(.invalidData))
//            }
//        }
//
//        task.resume()
//    }


