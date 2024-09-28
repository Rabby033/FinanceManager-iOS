//
//  BalanceCapsul.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 28/9/24.
//

import SwiftUI

struct BalanceCapsul: View {
    
    @State var icon : String
    @State var title : String
    @State var amount : String
    var color : Color
    
    var body: some View {
        HStack{
            Image(icon)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(title == "Income" ? Color.CustomGreen : Color.CustomRed)
                .frame(width: 32, height: 32)
                .padding(.all,10)
                .background(
                    Color.white
                        .cornerRadius(20)
                )
            VStack (alignment: .leading){
                Text(title)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                Text(amount)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding(.horizontal,5)
        }
        .padding(.horizontal,15)
        .padding(.vertical,12)
        .background(
            color
                .cornerRadius(25)
        )
    }
}

#Preview {
    BalanceCapsul(icon: "income", title: "Income", amount: "$5000", color: Color.green)
}
