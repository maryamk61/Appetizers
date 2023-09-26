//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Maryam Kaveh on 6/22/1402 AP.
//

import Foundation

@MainActor
class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var errorTitle = "" {
        didSet {
            showErrorAlert.toggle()
        }
    }
    @Published var errorMessage = ""
    @Published var showErrorAlert = false
    @Published var isLoading = false
    
    @Published var showDetailsView = false
    @Published var selectedAppetizer: Appetizer?
    
    let networkManager = NetworkManager.shared
    
    init() {
//        URLCache.shared.memoryCapacity = 10_000_000
//        URLCache.shared.diskCapacity = 500_000_000
        getAppetizers()
    }
    
    func getAppetizers() {
        self.isLoading = true
        Task {
            do {
                appetizers = try await networkManager.getAppetizers()
                self.isLoading = false
            } catch {
                if let appError = error as? AppetizerError {
                    self.errorTitle = appError.title
                    self.errorMessage = appError.localizedDescription
                } else { // general error
                    self.errorTitle = AppetizerError.badResponse.title
                    self.errorMessage = error.localizedDescription
                }
            }
        }
//        networkManager.getAppetizers { result in
//            DispatchQueue.main.async {
//                switch result {
//                case .failure(let error):
//                    self.errorTitle = error.title
//                    self.errorMessage = error.localizedDescription
//                    self.isLoading = true
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                    self.isLoading = false
//                }
//            }
//        }
    }
}
