//
//  Alert.swift
//  Appetizers App
//
//  Created by Berkin KOCA on 15.03.2024.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    //MARK: - Network Alerts
    static let testAlert = AlertItem(title: Text("TEST Title"),
                                     message: Text("Test Message"),
                                     dismissButton: .default(Text("OK")))
    
    static let invalidData = AlertItem(title: Text("Server Error"),
                                        message: Text("The data recieved from the server is invalid. Please Contact Support"),
                                        dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                            message: Text("Invalid response from the server. Please try again later."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                       message: Text("There was an issue connecting to server. If this persists, Please contact Support"),
                                       dismissButton: .default(Text("OK")))
    
    static let unableToComplete =  AlertItem(title: Text("Server Error"),
                                             message: Text("Unable to complete your request at this time. Please check your internet connection"),
                                             dismissButton: .default(Text("OK")))
    
    //MARK: - Account Alerts
    
    static let invalidForm =  AlertItem(title: Text("Invalid Form"),
                                             message: Text("Please ensure all fields in the form have been filled out."),
                                             dismissButton: .default(Text("OK")))
    
    static let invalidEmail =  AlertItem(title: Text("Invalid Email"),
                                             message: Text("Please ensure your email is correct."),
                                             dismissButton: .default(Text("OK")))
    
    static let userSaveSuccess = AlertItem(title: Text("Profile Saved"),
                                           message: Text("Your profile information was succesfully saved"),
                                           dismissButton: .default(Text("Done")))
    
    static let userSaveFail = AlertItem(title: Text("Profile Saved Failed"),
                                        message: Text("Your profile information couldn't saved"),
                                        dismissButton: .default(Text("Done")))
    
        
    static let invalidUserData = AlertItem(title: Text("Invalid User Data"),
                                        message: Text("There was an issue retrieving data from memory"),
                                        dismissButton: .default(Text("OK")))
}
