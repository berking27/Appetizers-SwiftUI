//
//  AppetizerListViewModel.swift
//  Appetizers App
//
//  Created by Berkin KOCA on 13.03.2024.
//

import Foundation

@MainActor final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var selectedAppetizer: Appetizer?
    @Published var isShowingDetail = false
    @Published var isLoading = false
    
    
    func getAppetizers() {
        isLoading = true
            
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
                alertItem = AlertContext.genericError
                isLoading = false
            }
        }
     
    }
}


//MARK: - Old Network Calls
//    func getAppetizers() {
//        isLoading = true
//
//        NetworkManager.shared.getAppetizers { [self] result in
//            DispatchQueue.main.async { [self] in
//                isLoading = false
//                switch result {
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//
//                case .failure(let error):
//                    switch error {
//                    case .invalidData:
//                        alertItem = AlertContext.invalidData
//
//                    case .invalidURL:
//                        alertItem = AlertContext.invalidURL
//
//                    case .invalidResponse:
//                        alertItem = AlertContext.invalidResponse
//
//                    case .unableToComplete:
//                        alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
