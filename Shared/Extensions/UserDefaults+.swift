//
//  UserDefaults+.swift
//  SNS Like UI
//
//  Created by 土橋正晴 on 2021/10/28.
//

import Foundation

extension UserDefaults {
    enum Key: String {
        case auth
        case profile
    }
    
    
    func getString(key: Key) -> String  {
        UserDefaults.standard.string(forKey: key.rawValue) ?? ""
    }
    
    func setString(key: Key, value: String) {
        return UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    
    func getBool(key: Key) -> Bool  {
        UserDefaults.standard.bool(forKey: key.rawValue)
    }
    
    func setBool(key: Key, value: Bool) {
        return UserDefaults.standard.set(value, forKey: key.rawValue)
    }
}
