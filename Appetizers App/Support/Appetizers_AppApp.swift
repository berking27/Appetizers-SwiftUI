//
//  Appetizers_AppApp.swift
//  Appetizers App
//
//  Created by Berkin KOCA on 13.03.2024.
//

import SwiftUI

@main
struct Appetizers_AppApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
        }
    }
}
