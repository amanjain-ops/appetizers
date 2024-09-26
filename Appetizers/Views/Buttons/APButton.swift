//
//  APButton.swift
//  Appetizers
//
//  Created by Aman Jain on 26/09/24.
//

import SwiftUI

struct APButton: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundStyle(.white)
            .background(Color.brandPrimaryy)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    APButton(title: "Test button")
}
