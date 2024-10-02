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
                        TextField("First Name", text: $viewModel.user.firstName)
                        TextField("Last Name", text: $viewModel.user.lasttName)
                        TextField("Email", text: $viewModel.user.email)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.none)
                            .autocorrectionDisabled(true)
                        
                        DatePicker("Birthday", selection: $viewModel.user.birthdate, displayedComponents: .date)
                        
                        
                        Button {
                            viewModel.saveChanges()
                        } label: {
                            Text("Save Changes")
                            //                            .foregroundStyle(Color(.brandPrimary))
                        }
                    } // personal info section
                    
                    Section("Requests") {
                        Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                        
                        Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .brandPrimaryy))
                    
                }
                .navigationTitle("🤣 Account")
            
        }
        .onAppear{
            viewModel.retrieveUser()
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
