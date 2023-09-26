//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Maryam Kaveh on 6/22/1402 AP.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var ordersObject = Order()

    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(ordersObject)
        }
    }
}
