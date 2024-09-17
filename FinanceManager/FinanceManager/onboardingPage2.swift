//
//  onboardingPage2.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 17/9/24.
//

import SwiftUI

struct OnboardingPage2: View {
    
    @State private var permission: Bool = false
    
    var body: some View {
        VStack {
            Image("notification")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.all,100)
            
            Text("Would you like to get Reminder to add your daily transaction?")
                .fontWeight(.bold)
                .font(.body)
                .foregroundColor(.green)
                .padding(.horizontal,30)
            
            HStack{
                
                Toggle(isOn: $permission, label: {
                    Text("Show reminder notification")
                        .font(.body)
                        .fontWeight(.semibold)
                })
                .padding(.horizontal,50)
            }
            
             
            
            Spacer()
        }
    }
}

#Preview {
    OnboardingPage2()
}
