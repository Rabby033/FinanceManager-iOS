//
//  OnboardingNextButtton.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 18/9/24.
//

import SwiftUI

struct ButtonView: View {
    
    @Binding var selectedIndex: Int
    
    var body: some View {
        
            
            Button(action: {
                
                print("current page \(selectedIndex)")
                
                if selectedIndex < 3 {
                    selectedIndex += 1
                }
                
            }, label: {
                
                Text(buttonTitle)
                    .fontWeight(.semibold)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(40)
                    .padding(.horizontal,16)
                    .padding(.bottom,20)
                
            })
    }
    
    private var buttonTitle: String {
        selectedIndex == 2 ? "Get Started" : "Next"
    }
    
    private var destinationView: some View {
        switch selectedIndex {
        case 0:
            return AnyView(OnboardingPage1())
        case 1:
            return AnyView(OnboardingPage2())
        case 2:
            return AnyView(OnboardingPage2())
        default:
            return AnyView(Text("Unknown Page"))
        }
    }
    
}
