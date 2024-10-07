//
//  DataBase.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 5/10/24.
//

import Foundation
import SwiftUI

public class DataBase {
    
    func getExpenseCategory() -> [ExpenseCategoryModel]  {
        var expenseCategories: [ExpenseCategoryModel] = []
        
        expenseCategories.append(ExpenseCategoryModel(categoryName: "Shopping",iconName: "shopping-bag",iconColor: Color.CustomBlue))
        expenseCategories.append(ExpenseCategoryModel(categoryName: "Transaportation",iconName: "car",iconColor: Color.CustomRed))
        expenseCategories.append(ExpenseCategoryModel(categoryName: "Restaurant",iconName: "food",iconColor: Color.CustomGreen))
        expenseCategories.append(ExpenseCategoryModel(categoryName: "Grossery",iconName: "shopping-bag",iconColor: Color.CustomBlue))
        
        return expenseCategories
    }
    
    
    func getWalletType() -> [WalletType]  {
        var walletType: [WalletType] = []
        walletType.append(WalletType(categoryName:"Salary",iconName: "salary",iconColor:Color.CustomGreen))
        walletType.append(WalletType(categoryName: "Saving",iconName: "salary",iconColor:Color.CustomRed))
        walletType.append(WalletType(categoryName: "Deposit",iconName: "salary",iconColor:Color.CustomBlue))
        walletType.append(WalletType(categoryName: "Critical Account",iconName: "salary",iconColor:Color.CustomGreen))
        
        return walletType
    }
}
