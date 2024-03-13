//
//  AppetizerTabView.swift
//  Appetizers App
//
//  Created by Berkin KOCA on 13.03.2024.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                        .symbolRenderingMode(.monochrome)
                    Text("Order")
                }
        }
        .accentColor(.brandPrimary)
    }
}

#Preview {
    AppetizerTabView()
}
