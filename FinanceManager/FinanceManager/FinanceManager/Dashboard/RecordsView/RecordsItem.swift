//
//  RecordsItem.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 23/9/24.
//

import SwiftUI

struct RecordsItem: View {
    var body: some View {
        
        
        VStack {
            HStack(spacing: 30){
                
                Image("education")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40,height: 40)
                    .clipShape(Circle())

                
                VStack(alignment:.leading) {
                    Text("Title")
                        .padding(.leading,0)
                    Text("SubTitle")
                }
                
                Spacer()
                
                Text("-510$")
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal,10)

        }
        .padding()
        
        
    }
}

#Preview {
    RecordsItem()
}
