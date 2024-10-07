//
//  ExpenseCategoryModel.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 5/10/24.
//

import Foundation
import SwiftUI


protocol CategoryProtocol {
    var categoryName : String? {set get}
    var iconName: String? {set get}
    var iconColor: Color? {set get}
}

class ExpenseCategoryModel : Identifiable, CategoryProtocol{
   
    
    
    var categoryName : String?
    var iconName: String?
    var iconColor: Color?
    
    init(categoryName: String? = nil, iconName: String? = nil, iconColor: Color? = nil) {
        self.categoryName = categoryName
        self.iconName = iconName
        self.iconColor = iconColor
    }
}
