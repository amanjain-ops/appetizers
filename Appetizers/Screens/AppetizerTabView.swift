//
//  ContentView.swift
//  Appetizers
//
//  Created by Aman Jain on 19/09/24.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem{
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem{
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .accentColor(.brandPrimaryy)
    }
}

#Preview {
    AppetizerTabView()
}
