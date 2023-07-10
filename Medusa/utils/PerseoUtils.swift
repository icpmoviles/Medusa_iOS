//
//  PerseoUtils.swift
//  Medusa
//
//  Created by Ventura de Lucas on 12/6/23.
//

import Foundation
import KeychainSwift
import SwiftyJSON

class PerseoUtils {
    
    private static var keychainAccessToken = "8AU6VN5BL2.es.icp.perseo.KeychainGroup"
    private static var accountsKey = "my perseo accounts"
    private static var keychain : KeychainSwift?
    
    public static func getKeychainAccessGroup() -> KeychainSwift {
        if (keychain == nil) {
            keychain = KeychainSwift()
            keychain?.synchronizable = true
            keychain?.accessGroup = keychainAccessToken
        }
        return keychain!
    }
    
    public static func obtencionKeyChain() -> PerseoAccountList {
        let keychain = getKeychainAccessGroup()
        let data = keychain.get(accountsKey) as String?
        let jsonData = PerseoAccountList.fromJSON(jsonString: data ?? "")
        return jsonData
    }
    
    public static func accesoKeyChain(perseoAccountList: PerseoAccountList, user: String, pass: String) -> Bool {
        var found = false
        for account in perseoAccountList.accountsList {
            if (account.user == user) {
                found = true
                account.lastLogin = NSDate().timeIntervalSince1970
                break
            }
        }
        
        if (!found) {
            perseoAccountList.accountsList.append(PerseoAccount(user: user, pass: pass, lastLogin: NSDate().timeIntervalSince1970))
        }
        
        let keychain = getKeychainAccessGroup()
        let json = PerseoAccountList.toJSON(perseoAccountList)
        keychain.set(json(), forKey: accountsKey)
        return true
    }
    
}
