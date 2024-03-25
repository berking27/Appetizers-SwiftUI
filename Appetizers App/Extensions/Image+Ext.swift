//
//  Image+Ext.swift
//  Appetizers App
//
//  Created by Berkin KOCA on 25.03.2024.
//

import SwiftUI

extension Image {
    func listCellImageStyle() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 90)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 8, height: 8)))
    }
}
