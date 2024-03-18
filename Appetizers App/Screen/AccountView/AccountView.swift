//
//  AccountView.swift
//  Appetizers App
//
//  Created by Berkin KOCA on 13.03.2024.
//

import SwiftUI

struct AccountView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var birthDate = Date()
    @State private var extraNapkins = false
    @State private var frequentRefills = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    DatePicker("Birthday", 
                               selection: $birthDate,
                               displayedComponents: .date)
                    
                    Button {
                        print("Save")
                    } label: {
                        Text("Save Changes")
                    }
                    
                } header: {
                    Text("Personal Info")
                }
                
                Section {
                    Toggle(isOn: $extraNapkins) {
                        Text("Extra Napkins")
                    }
                    
                    Toggle(isOn: $frequentRefills) {
                        Text("Frequent Refills")
                    }
                    
                } header: {
                    Text("Requests")
                }
                .tint(.brandPrimary)

            }
            .navigationTitle("👤 Acount")
        }
    }
}

#Preview {
    AccountView()
}
