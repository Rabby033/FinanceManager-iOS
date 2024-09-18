//
//  OnboardingTopView.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 18/9/24.
//

import SwiftUI

struct OnboardingTopView: View {
    
    @Binding var selectedIndex: Int
    @State var gotoDashboard: Bool
    
    var body: some View {
        HStack{
            
            if selectedIndex == 0 {
                Text("Welcome")
                    .font(.title)
                    .fontWeight(.semibold)
                    .kerning(1.4)
            } else {
                
                Image(systemName: "chevron.backward.circle")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.green)
                    .padding()
                    .onTapGesture {
                        selectedIndex -= 1
                    }
            }
            
            
            Spacer()
            
            
            NavigationLink(destination: Text("dfkldhf") , isActive: $gotoDashboard) {
                Button(action: {
                    gotoDashboard = true
                }, label: {
                    Text("Skip")
                        .foregroundColor(.green)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                    
                })
            }
            
        }.padding()
            .foregroundColor(.black)
    }
}

