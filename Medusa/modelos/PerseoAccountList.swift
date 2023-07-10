//
//  PerseoAccountList.swift
//  Medusa
//
//  Created by Ventura de Lucas on 13/6/23.
//

import Foundation

final class PerseoAccountList : Codable{
    var accountsList: [PerseoAccount]
    
    init() {
        self.accountsList = [PerseoAccount]()
    }
    
    init(accountsList: [PerseoAccount]) {
        self.accountsList = accountsList
    }
    
    func toJSON() -> String {
        do {
            let data = try JSONEncoder().encode(self)
            let cadena = String(data: data, encoding: .utf8)
            return cadena ?? ""
        } catch {
            return ""
        }
    }
    
    static func fromJSON(jsonString: String) -> PerseoAccountList {
        do {
            let jsonData = jsonString.data(using: .utf8)!
            let decoder = JSONDecoder()
            let perseoAccountList = try decoder.decode(PerseoAccountList.self, from: jsonData)
            return perseoAccountList
        } catch {
            return PerseoAccountList()
        }
    }
    
}
