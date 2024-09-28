//
//  DashboardView.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 22/9/24.
//

import SwiftUI

struct DashboardView: View {
    
    @State private var activeTab: Tab = .home
    @State private var tabShapePosition: CGPoint = .zero
    @State private var isAddPressed: Bool = false
    
    var body: some View {
        
        VStack(spacing: 0){
            switch activeTab {
            case .home:
                HomeView()
            case .transaction:
                RecordsView()
            case .budget:
                BudgetView()
            case .add:
                HomeView()
            case .profile:
                SettingView()
            }
            ZStack {
                if isAddPressed {
                    plusMenu(widthAndHeight: 55)
                        .padding(.top,-170)
                        .transition(.scale)
                    
                }
                CustomTabBar()
            }
            
            
        }
        .navigationBarHidden(true)
    }
    
    @ViewBuilder
    func CustomTabBar(_ tint:Color = Color.green ,_ inactiveTint: Color = .green) -> some View {
        HStack(alignment: .bottom ,spacing: 0){
            ForEach(Tab.allCases, id: \.rawValue) {
                TabItem(tint: tint, inactiveTint: inactiveTint, tab: $0, isAddPressed: $isAddPressed, activeTab: $activeTab)
            }
        }
        .padding(.horizontal,15)
        //        .frame(height: 50)
        .background(content: {
            Rectangle()
                .fill(.white)
                .ignoresSafeArea()
            
        })
    }
}

struct TabItem: View {
    
    var tint: Color
    var inactiveTint: Color
    var tab : Tab
    @Binding var isAddPressed : Bool
    @Binding var activeTab : Tab
    
    @State private var tabposition : CGPoint = .zero
    
    var body: some View {
        
        
        VStack (spacing: 0){
            var fill_color : Color = Color(red: 127 / 255, green: 61 / 255, blue: 255 / 255)
            
            Image(tab.systemImage)
                .resizable()
                .renderingMode(.template)
                .font(.title2)
                .foregroundColor(
                    tab == activeTab ? fill_color : Color.gray
                )
                .frame(width: tab.rawValue == "Add" ? 55 : 40, height: tab.rawValue == "Add" ? 55 : 40)
                .rotationEffect(Angle(degrees: isAddPressed ? tab.rawValue == "Add" ? 90 :0 : 0))
            
            
            Text(tab.rawValue)
                .font(.caption)
                .foregroundColor(activeTab == tab ? fill_color  : .gray)
            
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .onTapGesture {
            activeTab = tab
            if tab.rawValue == "Add" {
                withAnimation{
                    isAddPressed.toggle()
                }
            }
            print(tab.rawValue)
        }
        
        
    }
    
}


struct plusMenu : View {
    
    let widthAndHeight : CGFloat
    
    var body: some View {
        
        
        VStack {
            
            ZStack {
                RoundIconCellView(height: widthAndHeight, width: widthAndHeight, backgroundColor: .blue, iconName: "currency-exchange")
                    .onTapGesture {
                        print("currency exchanged clicked")
                    }
            }
            
            HStack (spacing: 60){
                ZStack {
                    RoundIconCellView(height: widthAndHeight, width: widthAndHeight, backgroundColor: .green, iconName: "income")
                        .onTapGesture {
                            print("income add")
                        }
                }
                ZStack {
                    RoundIconCellView(height: widthAndHeight, width: widthAndHeight, backgroundColor: .red, iconName: "expense")
                        .onTapGesture {
                            print("expense add")
                        }
                }
            }
        }
        
    }
}




struct RoundIconCellView: View {
    
    var height: CGFloat
    var width: CGFloat
    var backgroundColor: Color
    var iconName: String
    
    var body: some View {
        
        Image(iconName)
            .resizable()
            .renderingMode(.template)
            .foregroundColor(.white)
            .aspectRatio(contentMode: .fit)
            .frame(width: 35,height: 45)
            .background(
                Circle()
                    .fill(backgroundColor)
                    .frame(width: width,height: height)
            )
    }
}
#Preview {
    DashboardView()
}
