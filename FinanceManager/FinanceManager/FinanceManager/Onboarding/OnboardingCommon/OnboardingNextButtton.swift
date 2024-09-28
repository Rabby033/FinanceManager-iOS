//
//  OnboardingNextButtton.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 18/9/24.
//

import SwiftUI

struct ButtonView: View {
    
    @Binding var selectedIndex: Int
    @State var gotoHomeView = false
    
    var body: some View {
        
        
            VStack{
                Button(action: {
                    
                    print("current page \(selectedIndex)")
                    print(PreferenceRepositoryImpl().getValue(key: AppKeyEnum.CURRENCEY_SIGN.rawValue))
                    
                    if selectedIndex < 2 {
                        withAnimation{
                            selectedIndex += 1
                        }
                    } else {
                        gotoHomeView = true
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
                
                NavigationLink(destination: DashboardView(), isActive: $gotoHomeView){
                    Text("")
                }
            }
            
        
        
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
            return AnyView(OnboardingPage3())
        default:
            return AnyView(Text("Unknown Page"))
        }
    }
    
}
