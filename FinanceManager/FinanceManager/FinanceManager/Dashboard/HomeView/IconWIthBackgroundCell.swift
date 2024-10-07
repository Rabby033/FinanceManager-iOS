//
//  IconWIthBackgroundCell.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 28/9/24.
//

import SwiftUI

struct IconWIthBackgroundCell: View {
    
    @State var iconName : String
    var themeColor: Color
    var heightWidth : CGFloat
    
    var body: some View {
        
        Image(iconName)
            .resizable()
            .renderingMode(.template)
            .foregroundColor(themeColor)
            .aspectRatio(contentMode: .fit)
            .frame(width: heightWidth, height: heightWidth)
            .padding(.all,8)
            .background(
                themeColor.opacity(0.19).cornerRadius(15)
            )
    }
}

#Preview {
    IconWIthBackgroundCell(iconName: "shopping-bag", themeColor: Color.CustomRed, heightWidth: 30)
}
