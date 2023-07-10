//
//  LoginResponse.swift
//  Medusa
//
//  Created by felipecambas on 3/5/23.
//

import Foundation

struct LoginResponse : Codable {
    var access_token : String
    var expires_in : Int
    var message : String
    var refresh_token : String
    var scope : String
    var status : String? = ""
    var token_type : String
}
