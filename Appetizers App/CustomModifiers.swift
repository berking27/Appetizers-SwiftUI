//
//  CustomModifiers.swift
//  Appetizers App
//
//  Created by Berkin KOCA on 20.03.2024.
//

import SwiftUI

struct StandartButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
        .buttonStyle(.bordered)
        .tint(.brandPrimary)
        .controlSize(.large)
    }
}
