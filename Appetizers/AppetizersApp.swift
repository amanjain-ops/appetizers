//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Aman Jain on 19/09/24.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
