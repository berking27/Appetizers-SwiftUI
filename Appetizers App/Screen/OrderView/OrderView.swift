//
//  OrderView.swift
//  Appetizers App
//
//  Created by Berkin KOCA on 13.03.2024.
//

import SwiftUI

struct OrderView: View {
    
    @State private var orderItems = MockData.orderItems
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(orderItems) { appetizer in
                        AppetizerListCell(appetizer: appetizer)
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(.plain)
                
                Button {
                    print("Order placed")
                } label: {
                    APButton(text: "$33.99 Order Now")
                }
                .padding(.bottom, 24)
            }
            .navigationTitle("🧾 Orders")
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView()
}
