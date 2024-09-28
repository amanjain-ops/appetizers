//
//  AccountView.swift
//  Appetizers
//
//  Created by Aman Jain on 19/09/24.
//

import SwiftUI

struct AccountView: View {
    @State private var firstName: String = ""
    @State private var lasttName: String = ""
    @State private var email: String = ""
    @State private var birthdate = Date()
    @State private var extraNapkins = false
    @State private var frequentRefills = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Form {
                    Section("Personal Info"){
                        TextField("First Name", text: $firstName)
                        TextField("Last Name", text: $lasttName)
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.none)
                            .autocorrectionDisabled(true)
                        
                        DatePicker("Birthday", selection: $birthdate, displayedComponents: .date)
                        
                        
                        Button {
                            print("Save")
                        } label: {
                            Text("Save Changes")
                            //                            .foregroundStyle(Color(.brandPrimary))
                        }
                    } // personal info section
                    
                    Section("Requests") {
                        Toggle("Extra Napkins", isOn: $extraNapkins)
                        
                        Toggle("Frequent Refills", isOn: $frequentRefills)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .brandPrimaryy))
                    
                }
                .navigationTitle("🤣 Account")
            }
        }
    }
}

#Preview {
    AccountView()
}
