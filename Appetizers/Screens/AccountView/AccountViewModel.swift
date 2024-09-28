//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Aman Jain on 28/09/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lasttName: String = ""
    @Published var email: String = ""
    @Published var birthdate = Date()
    @Published var extraNapkins = false
    @Published var frequentRefills = false
    
    @Published var alertItem: AlertItem?
    
    var isValidDForm: Bool {
        guard !firstName.isEmpty, !lasttName.isEmpty, !email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    func saveChanges() {
        guard isValidDForm else {return}
        print("Changes have been saved successfully")
    }
}
