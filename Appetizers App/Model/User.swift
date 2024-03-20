//
//  User.swift
//  Appetizers App
//
//  Created by Berkin KOCA on 19.03.2024.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthDate = Date()
    var extraNapkins = false
    var frequentRefills = false
    
}
