//
//  OrderView.swift
//  Appetizers
//
//  Created by Maryam Kaveh on 6/22/1402 AP.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(order.orders) { appetizer in
                            AppetizerListRowView(appetizer: appetizer)
                                .listRowSeparator(.visible)
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(.inset)
                    
                    AppetizerButton(title: "$\(order.totalAmount) - Place Order") {
                        print("Place Order pressed!!!")
                    }
                    .tint(Color("brandPrimary"))
                    
                }
                if order.orders.isEmpty {
                    EmptyStateView(image: Image(systemName: "doc"), text: "You have no items in your order.\n Please add an appetizer!")
                }
            }
            .navigationTitle("Orders")
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.removeOrders(offset: offsets)
    }
    
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
