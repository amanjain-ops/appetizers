//
//  OrderView.swift
//  Appetizers
//
//  Created by Aman Jain on 19/09/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) {appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(.plain)
                    
                    Button {
                        print("Place order")
                    } label: {
                        APButton(title: String(format: "$%.2f - Add to Order", order.totalPrice))
                    }
                    .padding(.bottom, 25)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order.\nPlease add an appetizer!")
                }
                
            }
            .navigationTitle("🧾 Orders")
        }
    }
    

}

#Preview {
    OrderView()
}
