//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Aman Jain on 25/09/24.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    
    func getAppetizer() {
        isLoading = true
        
        NetworkManager.shared.getAppetizers { result in
            // we used this because its run on background thread and make it to main thread we use DispatchQueue.main.async
            DispatchQueue.main.async {
                
                self.isLoading = false
                switch result {
                    
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    
                    switch error {
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                        
                    }// switch case for error
                    
                } //switch case for result
            } // dispatchQueue
           
        } // NetworkManager
    } // getAppetizer
}
