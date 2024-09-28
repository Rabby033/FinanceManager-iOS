//
//  IconWIthBackgroundCell.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 28/9/24.
//

import SwiftUI

struct IconWIthBackgroundCell: View {
    
    @State var iconName : String
    
    var body: some View {
        
        Image(iconName)
            .resizable()
            .renderingMode(.template)
            .foregroundColor(Color.pillTextColor)
            .aspectRatio(contentMode: .fit)
            .frame(width: 40, height: 40)
            .padding(.all,10)
            .background(
                Color.pillColor.cornerRadius(15)
            )
    }
}

#Preview {
    IconWIthBackgroundCell(iconName: "shopping-bag")
}
