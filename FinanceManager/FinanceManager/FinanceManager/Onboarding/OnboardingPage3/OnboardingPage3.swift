//
//  onboardingPage2.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 17/9/24.
//

import SwiftUI

struct OnboardingPage3: View {
    
    @State private var permission: Bool = false
    
    var body: some View {
        VStack {
            Image("crash_analytics")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250,height:250)
                .padding(.bottom,50)
            
            Text("Help improving FinanceManger by sending usage statistics and crash reports.")
                .fontWeight(.bold)
                .font(.body)
                .foregroundColor(.green)
                .padding(.horizontal,30)
                .padding(.bottom,30)
            
            HStack{
                
                Toggle(isOn: $permission, label: {
                    Text("Send crash & usage statistics")
                        .font(.body)
                        .fontWeight(.semibold)
                })
            }
            .padding(.horizontal,30)
            
             
            Spacer()
        }
    }
}

#Preview {
    OnboardingPage3()
}
