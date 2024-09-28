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
                .frame(width: 250,height:250)
                .padding(.bottom,50)
            
            Text("Would you like to get Reminder to add your daily transaction?")
                .fontWeight(.bold)
                .font(.body)
                .foregroundColor(.green)
                .padding(.horizontal,30)
                .padding(.bottom,30)
            
            HStack{
                
                Toggle(isOn: $permission, label: {
                    Text("Show reminder notification")
                        .font(.body)
                        .fontWeight(.semibold)
                }) 
                .padding(.horizontal,50)
                .onChange(of: permission) { newValue in
                    if newValue {
                        
                        Task{
                            await takepermission()
                        }
                        
                    } else {
                        print("OFF")
                    }
                }
            }
            
            
            
            
            
            Spacer()
        }
    }
    
    private func takepermission() async{
        let center = UNUserNotificationCenter.current()
        do {
            try await center.requestAuthorization(options: [.alert, .sound, .badge])
        } catch {
            // Handle errors that may occur during requestAuthorization.
        }
    }
}

#Preview {
    OnboardingPage2()
}
