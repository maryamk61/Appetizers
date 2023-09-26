//
//  DateExtension.swift
//  Appetizers
//
//  Created by Maryam Kaveh on 7/3/1402 AP.
//

import Foundation

extension Date {
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date()) ?? Date()
    }
    
    var oneHundredTenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: Date()) ?? Date()
    }
}
