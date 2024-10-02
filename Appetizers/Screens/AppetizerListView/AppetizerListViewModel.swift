//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Aman Jain on 25/09/24.
//

import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    //    func getAppetizer() {
    //        isLoading = true
    //
    //        NetworkManager.shared.getAppetizers { result in
    //            // we used this because its run on background thread and make it to main thread we use DispatchQueue.main.async
    //            DispatchQueue.main.async {
    //
    //                self.isLoading = false
    //                switch result {
    //
    //                case .success(let appetizers):
    //                    self.appetizers = appetizers
    //
    //                case .failure(let error):
    //
    //                    switch error {
    //
    //                    case .invalidResponse:
    //                        self.alertItem = AlertContext.invalidResponse
    //
    //                    case .invalidURL:
    //                        self.alertItem = AlertContext.invalidURL
    //
    //                    case .invalidData:
    //                        self.alertItem = AlertContext.invalidData
    //
    //                    case .unableToComplete:
    //                        self.alertItem = AlertContext.unableToComplete
    //
    //                    }// switch case for error
    //
    //                } //switch case for result
    //            } // dispatchQueue
    //
    //        } // NetworkManager
    //    } // getAppetizer
    
    
    func getAppetizer() {
        isLoading = true
        
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                
                if let apError = error as? APError {
                    switch apError {
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse // we're going to use genretic error
                }
                
                isLoading = false
            }
        }
    }
}
