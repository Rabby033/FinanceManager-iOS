//
//  CommonDetailsPageViewModel.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 8/10/24.
//

import Foundation
import SwiftUI

class CommonDetailsPageViewModel : ObservableObject {
    
    @Published var amount: String
    @Published var category: String
    @Published var description: String
    @Published var wallet: String
    @Published var themeColor: Color = Color.CustomRed
    @Published var pageTitle: String 
    @Published var pageType : DetailsPageEnum
    
    init(amount: String, category: String, description: String, wallet: String, themeColor: Color, pageTitle: String, pageType: DetailsPageEnum) {
        self.amount = amount
        self.category = category
        self.description = description
        self.wallet = wallet
        self.themeColor = themeColor
        self.pageTitle = pageTitle
        self.pageType = pageType
    }
}
