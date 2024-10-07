//
//  PlusMenu.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 8/10/24.
//

import SwiftUI

struct plusMenu: View {
    
    let widthAndHeight: CGFloat
    
//    @State private var gotoCurrenyExchangeView: Bool = false
//    @State private var gotoAddIncomeView: Bool = false
//    @State private var gotoAddExpenseView: Bool = false
    @ObservedObject var viewModel = PlusMenuViewModels()
    
    @Binding  var isAddPressed : Bool
    
    var body: some View {
        VStack {
            
            allNavigation()
            
            ZStack {
                
                
                RoundIconCellView(height: widthAndHeight, width: widthAndHeight, backgroundColor: .blue, iconName: "currency-exchange")
                    .onTapGesture {
                        viewModel.gotoCurrenyExchangeView = true
                    }
            }
            
            HStack (spacing: 60) {
                ZStack {
                    
                    RoundIconCellView(height: widthAndHeight, width: widthAndHeight, backgroundColor: .green, iconName: "income")
                        .onTapGesture {
                            viewModel.gotoAddIncomeView = true
                        }
                }
                
                ZStack {
                    
                    RoundIconCellView(height: widthAndHeight, width: widthAndHeight, backgroundColor: .red, iconName: "expense")
                        .onTapGesture {
                            viewModel.gotoAddExpenseView = true
                        }
                }
            }
        }
    }
    
    @ViewBuilder
    func allNavigation() -> some View{
        

        
        NavigationLink (destination: CommonDetailsPageView(viewmodel:  CommonDetailsPageViewModel(amount: "", category: "select category", description: "enter description", wallet: "select wallet type", themeColor: Color.CustomBlue, pageTitle: "Wallet Balance Transfer", pageType: .MONEY_TRANSFER)),isActive: $viewModel.gotoCurrenyExchangeView){
            EmptyView()
        }
        
        NavigationLink (destination: CommonDetailsPageView(viewmodel:  CommonDetailsPageViewModel(amount: "", category: "select category", description: "enter description", wallet: "select wallet type", themeColor: Color.CustomRed, pageTitle: "Add Expense", pageType: .EXPENSE)),isActive: $viewModel.gotoAddExpenseView){
            EmptyView()
        }
        
        NavigationLink (destination: CommonDetailsPageView(viewmodel:  CommonDetailsPageViewModel(amount: "", category: "select category", description: "enter description", wallet: "select wallet type", themeColor: Color.CustomGreen, pageTitle: "Add Income", pageType: .INCOME)),isActive: $viewModel.gotoAddIncomeView){
            EmptyView()
        }
        
        
//        NavigationLink(destination: CommonDetailsPageView(amount: "", category: "Category", description: "Destination", wallet: "Wallet",pageTitle: "Currency Exchange",pageType: .MONEY_TRANSFER ), isActive: $viewModel.gotoCurrenyExchangeView) {
//            EmptyView()
//        }
//        
//        NavigationLink(destination: CommonDetailsPageView(amount: "", category: "Category", description: "Destination", wallet: "Wallet", pageTitle: "Income", pageType: .INCOME), isActive: $viewModel.gotoAddIncomeView) {
//            EmptyView()
//        }
//        
//        NavigationLink(destination: CommonDetailsPageView(amount: "", category: "Category", description: "Destination", wallet: "Wallet",pageTitle: "Expense", pageType: .EXPENSE), isActive: $viewModel.gotoAddExpenseView) {
//            EmptyView()
//        }
    }
}

//#Preview {
//    plusMenu(widthAndHeight: 55.0, isAddPressed: 55.0)
//}
