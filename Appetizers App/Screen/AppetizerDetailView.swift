//
//  AppetizerDetailView.swift
//  Appetizers App
//
//  Created by Berkin KOCA on 18.03.2024.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
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
                    NutritionInfoView(title: "Calories", value: appetizer.calories)
                    
                    NutritionInfoView(title: "Carbs", value: appetizer.carbs)
                    
                    NutritionInfoView(title: "Protein", value: appetizer.protein)
                    
                }
            }
            
            Spacer()
            
            Button {
                print("Button Tapped")
            } label: {
                APButton(text: "$\(appetizer.price, specifier: "%.2f") -Add to Order")
            }
            .padding(.bottom, 32)
            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12.0))
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer,
                        isShowingDetail: .constant(true))
}

//MARK: - Extracted Views

struct NutritionInfoView: View {
    var title: String
    var value: Int
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .bold()
            
            if title == "Calories" {
                Text("\(value)")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            } else {
                Text("\(value) g")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
        }
        .bold()
    }
}
