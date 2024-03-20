//
//  View+Ext.swift
//  Appetizers App
//
//  Created by Berkin KOCA on 20.03.2024.
//

import SwiftUI

extension View {
    func standardButtonStyle() -> some View{
        self.modifier(StandartButtonStyle())
    }
}
