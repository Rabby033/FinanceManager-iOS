//
//  AccountViewItem.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 23/9/24.
//

import SwiftUI

struct AccountViewItem: View {
    var body: some View {
        VStack (alignment: .leading){
            HStack(spacing: 0){
                
                Image("accountIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .background(Circle().fill(Color.white)) // Background circle, optional
                    .overlay(
                        Circle()
                            .stroke(Color.green, lineWidth: 1.5) // Green stroke
                    )
                
                VStack(alignment:.leading) {
                    Text("Cash")
                        .padding(.leading,0)
                    
                    HStack {
                        Text("Balance: ")
                        Text("-1053987.90 $ ")
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                    }
                    
                }
                .padding(.leading)
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .font(.title2)
                    .foregroundColor(.green)
                    .padding(.trailing,3)
                
            }
            .frame(maxWidth: .infinity)
            .padding(.leading,5)
            


        }
        .padding()
    }
}

#Preview {
    AccountViewItem()
}
