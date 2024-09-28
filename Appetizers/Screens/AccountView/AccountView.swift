//
//  AccountView.swift
//  Appetizers
//
//  Created by Aman Jain on 19/09/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    
    
    var body: some View {
        NavigationStack {
                Form {
                    Section("Personal Info"){
                        TextField("First Name", text: $viewModel.firstName)
                        TextField("Last Name", text: $viewModel.lasttName)
                        TextField("Email", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.none)
                            .autocorrectionDisabled(true)
                        
                        DatePicker("Birthday", selection: $viewModel.birthdate, displayedComponents: .date)
                        
                        
                        Button {
                            viewModel.saveChanges()
                        } label: {
                            Text("Save Changes")
                            //                            .foregroundStyle(Color(.brandPrimary))
                        }
                    } // personal info section
                    
                    Section("Requests") {
                        Toggle("Extra Napkins", isOn: $viewModel.extraNapkins)
                        
                        Toggle("Frequent Refills", isOn: $viewModel.frequentRefills)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .brandPrimaryy))
                    
                }
                .navigationTitle("🤣 Account")
            
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
