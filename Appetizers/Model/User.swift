//
//  User.swift
//  Appetizers
//
//  Created by Aman Jain on 28/09/24.
//

import Foundation


struct User: Codable {
    
    var firstName: String = ""
    var lasttName: String = ""
    var email: String = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
