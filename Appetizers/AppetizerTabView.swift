//
//  ContentView.swift
//  Appetizers
//
//  Created by Maryam Kaveh on 6/22/1402 AP.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Label("Appetizers", systemImage: "fork.knife.circle")
                        .fontWeight(.bold)
//                        .foregroundColor(Color("brandPrimary"))
                }
                
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                        .fontWeight(.bold)
                }
                .badge(order.orders.count)
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.circle.fill")
                        .fontWeight(.bold)
                }
        }
        // Set accent color in assets
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabView()
    }
}
