//
//  User.swift
//  Appetizers
//
//  Created by Maryam Kaveh on 6/29/1402 AP.
//

import Foundation

struct User: Codable {
    var firstname = ""
    var lastname = ""
    var email = ""
    var birthdate = Date()
    var needsNapkin = false
    var frequentRefills = true
}
