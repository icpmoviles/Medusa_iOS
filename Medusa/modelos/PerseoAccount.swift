//
//  PerseoAccount.swift
//  Medusa
//
//  Created by Ventura de Lucas on 12/6/23.
//

import Foundation
import SwiftyJSON

final class PerseoAccount : Codable{
    var user : String
    var pass : String
    var lastLogin : Double
    var selected : Bool
    
    init(user: String, pass: String, lastLogin: Double) {
        self.user = user
        self.pass = pass
        self.lastLogin = lastLogin
        self.selected = false
    }
    
}
