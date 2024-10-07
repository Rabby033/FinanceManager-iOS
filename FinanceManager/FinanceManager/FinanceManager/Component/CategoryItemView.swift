//
//  CategoryItemView.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 30/9/24.
//

import SwiftUI

struct CategoryItemView: View {
    
    var iconName: String
    var categoryName: String
    var themeColor: Color
    var categoryTappedAction: (_ id: String) -> Void
    var id = UUID().uuidString
    
    var body: some View {
        HStack (spacing:10){
            
            IconWIthBackgroundCell(iconName: iconName, themeColor: themeColor, heightWidth: 25)
            
            Text(categoryName)
                .font(.subheadline)
                .fontWeight(.regular)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical,8)
        .padding(.horizontal,15)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(1))
        )
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
        .padding(.horizontal,5)
        .onTapGesture {
            categoryTappedAction(categoryName)
        }
        
        
        
    }
}



#Preview {
    CategoryItemView(
        iconName: "shopping-bag",
        categoryName: "Shopping",
        themeColor: Color.red,
        categoryTappedAction: { id in
            print("Category tapped with id: \(id)")
        }
    )
}
