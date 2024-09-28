//
//  PopUpview.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 27/9/24.
//

import SwiftUI

struct PopUpview: View {
    @State private var show = false
    var body: some View {
        VStack(alignment: .leading){
            Text("Edit Budget")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.all)
            HStack{
                Text("Category: ")
                    .font(.title3)
                    .fontWeight(.light)
                
                Image("accountIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .background(Circle().fill(Color.white)) // Background circle, optional
                    .overlay(
                        Circle()
                            .stroke(Color.green, lineWidth: 1.5) // Green stroke
                    )
            }
            
            HStack (alignment: .center){
                Text("Limit: ")
                    .font(.title3)
                    .fontWeight(.light)
                TextField("Enter limit", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding(.all,5)
                    .frame(width: 120)
                    .background(
                        Rectangle()
                            .stroke(Color.green , lineWidth: 1.5)
                    )
            }
        }
    }
}

#Preview {
    PopUpview()
}
