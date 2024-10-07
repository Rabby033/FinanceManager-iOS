//
//  WalletType.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 5/10/24.
//

import Foundation
import SwiftUI

class WalletType :  Identifiable , CategoryProtocol {
    
    
    var categoryName: String?
    var iconName: String?
    var iconColor: Color?
    
    init(categoryName: String? = nil, iconName: String? = nil, iconColor: Color? = nil) {
        self.categoryName = categoryName
        self.iconName = iconName
        self.iconColor = iconColor
    }
    
}
