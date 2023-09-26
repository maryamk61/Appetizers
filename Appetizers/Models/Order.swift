//
//  Order.swift
//  Appetizers
//
//  Created by Maryam Kaveh on 6/31/1402 AP.
//

import Foundation

final class Order : ObservableObject {
    @Published private(set) var orders: [Appetizer] = []
    
    var totalAmount: Double {
        return orders.reduce(0) { $0 + $1.price}
        
    }
    
    func addToOrders(item: Appetizer) {
        orders.append(item)
    }
    
    func removeOrders(offset: IndexSet) {
        orders.remove(atOffsets: offset)
    }
}
