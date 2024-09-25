//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Aman Jain on 19/09/24.
//

import Foundation


final class NetworkManager {
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
//    static let baseURL = "https://run.mocky.io/v3/"
    private let appetizerURL = baseURL + "appetizers"
//    private let appetizerURL = baseURL + "e7f0ceb6-dd82-40bb-8aab-de1ed301fed6"
//    private let appetizerURL = baseURL + "61aa1048-81aa-4be0-afde-d6dc449a87ed"
    
    private init() {}
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
