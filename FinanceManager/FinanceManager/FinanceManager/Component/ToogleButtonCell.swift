//
//  ToogleButtonCell.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 2/10/24.
//

import SwiftUI

struct ToogleButtonCell: View {
    
    @State var istoogleOn : Bool
    var title : String
    var subtitle: String
    
    var body: some View {
        
        HStack{
            
            VStack (alignment:.leading){
                Text(title)
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                
                Text(subtitle)
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            
            Toggle(isOn: $istoogleOn, label: {
            })
            .foregroundColor(.red)
        }
        .padding(.horizontal,15)
        .padding(.vertical,8)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray.opacity(0.5),lineWidth: 1)
        )
        .padding(.horizontal)
    }
}

#Preview {
    ToogleButtonCell(istoogleOn: false,title: "Repeat",subtitle: "Repeat transaction")
}
