//
//  submitButton.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 30/9/24.
//

import SwiftUI

struct submitButton : View {
    
    var buttonName: String
    var buttonColor: Color
    
    var body: some View {
        HStack(alignment: .center,spacing:10){
            
            Button(action: {
                print("clicked")
            }, label: {
                Text(buttonName)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
            })
            
        }
        .frame(maxWidth: .infinity)
        .padding(.all,15)
        .background(
//            RoundedRectangle(cornerRadius: 15).stroke(Color.green.opacity(0.5),lineWidth: 1)
            RoundedRectangle(cornerRadius: 15).fill(buttonColor)
        )
        .padding(.horizontal,15)
        
    }
}


#Preview {
    submitButton(buttonName: "Continue", buttonColor: .green)
}
