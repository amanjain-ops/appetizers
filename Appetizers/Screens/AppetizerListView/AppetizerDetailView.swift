//
//  DetailsView.swift
//  Appetizers
//
//  Created by Aman Jain on 26/09/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetails: Bool
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 225)
                
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 225)
            }
            
            VStack {
                
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                
                HStack(spacing: 40) {
                    
                    NutritionDetails(title: "Calories", value: "\(appetizer.calories)")
                    NutritionDetails(title: "Carbs", value: "\(appetizer.carbs)")
                    NutritionDetails(title: "Protein", value: "\(appetizer.protein)")
                    
                }
            }
            
            Spacer()
            
            Button {
                order.add(appetizer)
                isShowingDetails = false
            } label: {
//                APButton(title: String(format: "$%.2f - Add to Order", appetizer.price))
                Text(String(format: "$%.2f - Add to Order", appetizer.price))
            }
            .modifier(StandardButtonStyle())
//            .buttonStyle(.bordered)
//            .tint(.brandPrimaryy)
//            .controlSize(.large)
            .padding(.bottom, 30)
            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetails = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer,
                        isShowingDetails: .constant(true))
    
}

struct NutritionDetails: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text(value)
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
