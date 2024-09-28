//
//  OnboardingBottomView.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 18/9/24.
//

import SwiftUI

struct OnboardingBottomView: View {
    
    @Binding var selectedIndex: Int
    @State var gotoNextPage: Bool
    
    var body: some View {
        VStack {
            HStack {
                
                Image(systemName: "info.circle.fill")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30,height: 30)
                    .foregroundColor(.green)
                
                Text("you can change it later from setting anytime")
                    .font(.body)
                    .padding()
            }
            PageControl(numberOfPages: 3, currentPage: $selectedIndex)
            ButtonView(selectedIndex: $selectedIndex)
        }
    }
}
