//
//  APError.swift
//  Appetizers App
//
//  Created by Berkin KOCA on 13.03.2024.
//

import Foundation

enum APError: String, Error{
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
