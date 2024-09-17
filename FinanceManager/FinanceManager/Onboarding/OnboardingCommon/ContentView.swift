//
//  ContentView.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 16/9/24.
//

import SwiftUI

struct OnboardingScreen : View {
    
    
    @State var currentPage: Int = 0
    @State var selectedIndex: Int = 0
    @State var navigate: Bool = false
    @State var gotoNextOnBoarding: Bool = false
    
    
    private var buttonTitle: String {
        selectedIndex == 2 ? "Get Started" : "Next"
    }
    
    var body: some View {
        
        
        ZStack{
            
            NavigationView {
                
                VStack {
                    
                    
                    OnboardingTopView(selectedIndex: $selectedIndex, gotoDashboard: gotoNextOnBoarding) /* onboarding TopView */
                    
                    TabView(selection:$selectedIndex){
                        
                        ForEach(0..<3){ index in
                            switch index{
                            case 0:
                                OnboardingPage1()
                            case 1:
                                OnboardingPage2()
                            case 2:
                                OnboardingPage1()
                            default:
                                Text("fatal error")
                            }
                        }
                        
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .onChange(of: selectedIndex, perform: {
                        value in
                        currentPage += 1
                    })
                    
                    
                    OnboardingBottomView(selectedIndex: $selectedIndex, gotoNextPage: gotoNextOnBoarding) /* onboarding bottomview */
                    
                }
            }
        }
    }
    
}












struct PageControl : View {
    
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    var body: some View {
        
        HStack{
            ForEach(0..<3) {
                index in
                Circle()
                    .frame(width: 8,height: 8)
                    .foregroundColor(index == currentPage ? .green : .gray)
                    .onTapGesture {
                        self.currentPage = index
                    }
            }
        }
        
    }
}


