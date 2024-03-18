//
//  AppetizerDetailView.swift
//  Appetizers App
//
//  Created by Berkin KOCA on 18.03.2024.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        VStack {
            Image(.asianFlankSteak)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 225)
              
            VStack(spacing: 12) {
                Text(appetizer.name)
                    .font(.title)
                
                Text(appetizer.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                
                HStack(spacing: 32) {
                    FoodDetailView(title: "Calories", value: appetizer.calories)
                    
                    FoodDetailView(title: "Carbs", value: appetizer.carbs)
                    
                    FoodDetailView(title: "Protein", value: appetizer.protein)
                    
                }
            }
            
            Spacer()
            
            Button {
                print("Button Tapped")
            } label: {
                Text("$\(appetizer.price, specifier: "%.2f") -Add to Order")
                .font(.title3)
                .fontWeight(.semibold)
                .frame(width: 240, height: 48)
                .background(.brandPrimary.gradient)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding(.bottom, 32)
            
            
                
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12.0))
        .shadow(radius: 40)
        .overlay(Button {
            print("Dismiss")
        } label: {
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.white)
                    .opacity(0.6)
                
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44, height: 44)
                    .foregroundStyle(.black)
            }
        }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer)
}


struct FoodDetailView: View {
    var title: String
    var value: Int
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .bold()
            
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
        }
        .bold()
    }
}
