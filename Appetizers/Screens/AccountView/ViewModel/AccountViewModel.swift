//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Maryam Kaveh on 6/28/1402 AP.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject {
//    @Published  var firstname: String = ""
//    @Published  var lastname: String = ""
//    @Published  var email: String = ""
//    @Published  var needsNapkin = false
//    @Published  var frequentRefills = true
//    @Published  var birthDate = Date()
    @Published var alertItem: AlertItem?
    @Published var showAlert = false
    @Published var user = User()
    @AppStorage("user") private var userData: Data?
    
    var isValidForm: Bool {
        guard !user.firstname.isEmpty && !user.lastname.isEmpty && !user.email.isEmpty else {
            self.alertItem = AlertItem(title: "Invalid Form", message: "Please make sure all fields are filled.", dismissButton: .default(Text("Ok")))
            return false
        }
        
        guard user.email.isValidEmail else {
            self.alertItem = AlertItem(title: "Invalid Email", message: "Please make sure Email is valid.", dismissButton: .default(Text("Ok")))
            return false
        }
        return true
    }
    
    func save() {
        showAlert = true
        guard isValidForm else {
            return
        }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            self.alertItem = AlertItem(title: "Profile Saved!", message: "Your information was successfully saved.", dismissButton: .default(Text("Ok")))
        } catch {
            self.alertItem = AlertItem(title: "Profile Error!", message: "There was an error saving or retreiving your information.", dismissButton: .default(Text("Ok")))
        }
    }
    
    func fetchuser() {
        do {
            guard let data = userData else {
                return
            }
            user = try JSONDecoder().decode(User.self, from: data)
           
        } catch {
            showAlert = true
            self.alertItem = AlertItem(title: "Profile Error!", message: "There was an error retreiving your information.", dismissButton: .default(Text("Ok")))
        }
    }
}
