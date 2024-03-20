//
//  APButton.swift
//  Appetizers App
//
//  Created by Berkin KOCA on 18.03.2024.
//

import SwiftUI

struct APButton: View {
    
    var text: LocalizedStringKey /// To be able to add specifier inside string
    
    var body: some View {
        Text(text)
        .font(.title3)
        .fontWeight(.semibold)
        .frame(width: 240, height: 48)
        .background(.brandPrimary.gradient)
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    APButton(text: "TEST BUTTON")
}
