//
//  AppetizerError.swift
//  Appetizers
//
//  Created by Maryam Kaveh on 6/22/1402 AP.
//

import Foundation

enum AppetizerError: Error {
    case badResponse
    case invalidUrl
    case invalidData
    case unableToComplete // unknown, Network
    
    
    var localizedDescription: String {
        switch self {
        case .badResponse :
            return "Invalid data from server! Try again later."
        case .invalidData :
            return "The data received from server is invalid!"
        case .invalidUrl :
            return "There was an issue connecting to the server!"
        case .unableToComplete :
            return "Unable to complete your request! The Internet connection appears to be offline."
            
        }
    }
    
    var title: String {
        switch self {
        case .badResponse:
            return "Server Error!"
        case .invalidUrl:
            return "Server Error!"
        case .invalidData:
            return "Server Error!"
        case .unableToComplete:
            return "Network Error!"
        }
    }
}
