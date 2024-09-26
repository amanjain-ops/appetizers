//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Aman Jain on 19/09/24.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            
            NavigationStack {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
                .navigationTitle("🍟 Appetizers")
            }
            .onAppear {
                viewModel.getAppetizer()
            }
            
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimaryy))
                    .scaleEffect(1.5)
            }
            
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
    
}

#Preview {
    AppetizerListView()
}
