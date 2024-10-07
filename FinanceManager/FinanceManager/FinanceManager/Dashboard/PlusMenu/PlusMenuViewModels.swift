//
//  PlusMenuViewModels.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 8/10/24.
//

import Foundation
class PlusMenuViewModels : ObservableObject {
    
    @Published var gotoCurrenyExchangeView: Bool = false
    @Published var gotoAddIncomeView: Bool = false
    @Published var gotoAddExpenseView: Bool = false
}
