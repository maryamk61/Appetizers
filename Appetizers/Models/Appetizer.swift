//
//  Appetizer.swift
//  Appetizers
//
//  Created by Maryam Kaveh on 6/22/1402 AP.
//

import Foundation
import SwiftUI

//URL:
// "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
//Response from server
/*
//{
//    "request": [
//        {
//            "imageURL": "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
//            "carbs": 0,
//            "name": "Asian Flank Steak",
//            "price": 8.99,
//            "calories": 300,
//            "description": "This perfectly thin cut just melts in your mouth.",
//            "protein": 14,
//            "id": 1
//        },
//        {
//            "imageURL": "https://seanallen-course-backend.herokuapp.com/images/appetizers/blackened-shrimp.jpg",
//            "carbs": 3,
//            "name": "Blackened Shrimp",
//            "price": 6.99,
//            "description": "Seasoned shrimp from the depths of the Atlantic Ocean.",
//            "calories": 450,
//            "protein": 4,
//            "id": 2
//        },
//        {
//            "imageURL": "https://seanallen-course-backend.herokuapp.com/images/appetizers/buffalo-chicken-bites.jpg",
//            "carbs": 22,
//            "name": "Buffalo Chicken Bites",
//            "price": 7.49,
//            "description": "The tasty bites of chicken have just the right amount of kick to them.",
//            "calories": 800,
//            "protein": 5,
//            "id": 3
//        }
//    ]
//}
 */

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let imageURL: String
    let price: Double
    let carbs: Int
    let calories: Int
    let protein: Int
    
}

struct MockData {
    
    static let mockAppetizers: [Appetizer] = [
        
        Appetizer(id: 1, name: "Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth.", imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", price: 8.99, carbs: 0, calories: 300, protein: 14),
        Appetizer(id: 2, name: "Blackened Shrimp", description:
                    "Seasoned shrimp from the depths of the Atlantic Ocean.", imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/blackened-shrimp.jpg", price: 8.99, carbs: 0, calories: 450, protein: 4),
        Appetizer(id: 3, name: "Buffalo Chicken Bites", description: "The tasty bites of chicken have just the right amount of kick to them.", imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/buffalo-chicken-bites.jpg", price: 7.49, carbs: 22, calories: 800, protein: 5),
        Appetizer(id: 4, name: "Chicken Avocado Spring Roll", description: "These won't last 10 seconds once they hit the table.", imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/buffalo-chicken-bites.jpg", price: 12.99, carbs: 22, calories: 800, protein: 7)
    ]
    
    static let mockAppetizer : Appetizer = Appetizer(id: 1, name: "Chicken Avocado Spring Roll", description: "This perfectly thin cut just melts in your mouth.", imageURL: "https://sseanallen-course-backend.herokuapp.com/images/appetizers/chicken-avocado-spring-roll.jpg", price: 8.99, carbs: 19, calories: 480, protein: 14)
}
