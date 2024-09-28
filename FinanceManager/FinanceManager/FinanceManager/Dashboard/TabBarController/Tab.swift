//
//  Tab.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 22/9/24.
//

import Foundation

enum Tab: String, CaseIterable {
    
    case home = "Home"
    case transaction = "Transaction"
    case add = "Add"
    case budget = "Budget"
    case profile = "Profile"
    
    var systemImage :  String {
        switch self {
        case .home:
            return "home"
        case .transaction:
            return "transaction"
        case .add:
            return "Add"
        case .budget:
            return "pie-chart"
        case .profile:
            return "user"
            
        }
    }
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}


