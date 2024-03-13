//
//  Appetizer.swift
//  Appetizers App
//
//  Created by Berkin KOCA on 13.03.2024.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let carbs: Int
    let protein: Int
    
}


struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: 0,
                                           name: "Test Appetizer",
                                           description: "This is Test Appetizer.",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           carbs: 12,
                                           protein: 33)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
