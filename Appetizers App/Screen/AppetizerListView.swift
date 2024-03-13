//
//  AppetizerListView.swift
//  Appetizers App
//
//  Created by Berkin KOCA on 13.03.2024.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationStack {
            List(MockData.appetizers) { appetizer in
                Text(appetizer.name)
            }
            .listStyle(.grouped)
            .navigationTitle("🍟 Appetizers")
        }
    }
}


#Preview {
    AppetizerListView()
}
