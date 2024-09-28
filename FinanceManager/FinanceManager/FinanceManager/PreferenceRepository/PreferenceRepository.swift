//
//  PreferenceRepository.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 17/9/24.
//

import Foundation
protocol PreferenceRepository {
    func updateData(forKey: String , value: String?)
    func setBoolvalue(forkey: String, value: Bool?)
    func getValue(key: String) -> Any?
}


class PreferenceRepositoryImpl : PreferenceRepository {
    
    let pref : UserDefaults
    
    init(){
        self.pref = UserDefaults.standard
    }
    
    func updateData(forKey: String, value: String?) {
        pref.set(value, forKey: forKey)
        pref.synchronize()
    }
    
    func getValue(key: String) -> Any? {
        return pref.object(forKey: key)
    }
    
    func setBoolvalue(forkey: String, value: Bool?) {
        pref.set(value,forKey:forkey)
        pref.synchronize()
    }
    
    
    
    
    
}
