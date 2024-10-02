//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Aman Jain on 02/10/24.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimaryy)
            .controlSize(.large)
    }
}
