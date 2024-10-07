//
//  HomeView.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 22/9/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        var pillColor : Color = Color(red: 252/255, green: 238/255, blue: 212/255)
        var pillTextColor : Color = Color(red: 253/255, green: 172/255, blue: 19/255)
        
        VStack (spacing:0){
            
            
            VStack (spacing: 5){
                HomeViewTopBar()
                
                Text("Account Balance")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                Text("$9244")
                    .font(.title2)
                    .fontWeight(.bold)
                    .fontWeight(.semibold)
                
                HStack(spacing:10){
                    BalanceCapsul(icon: "income", title: "Income", amount: "$5000", color: Color.CustomGreen)
                    BalanceCapsul(icon: "expense", title: "Expense", amount: "$3000", color: Color.red)
                }
                
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 255/255, green: 246/255, blue: 229/255,opacity: 1), // RGB for a blue color
                        Color(red: 248/255, green: 237/255, blue: 216/255,opacity: 0)  // RGB for a purple color
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            Image(systemName: "photo.on.rectangle")
                .resizable()
                .renderingMode(.template)
                .frame(maxWidth: .infinity)
                .frame(height: 150)
                .foregroundColor(.gray)
                .padding(.horizontal)
                .padding(.vertical,10)
            
            HStack(spacing:2){
                pillView(pillColor: pillColor, pillTextColor: pillTextColor, title: "Today")
                pillView(pillColor: pillColor, pillTextColor: pillTextColor, title: "Week")
                pillView(pillColor: pillColor, pillTextColor: pillTextColor, title: "Month")
                pillView(pillColor: pillColor, pillTextColor: pillTextColor, title: " Year")
            }
            .frame(maxWidth: .infinity)
            
            
            HStack{
                Text("Recent Transaction")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.leading,15)
                
                Spacer()
                
                pillView(pillColor: Color(red: 238/255, green: 230/255, blue: 255/255), pillTextColor: Color(red: 144/255, green: 87/255, blue: 255/255), title: "See All")
                    .padding(.trailing,10)
                    .onTapGesture {
                        
                    }
                
            }
            .padding(.top,8)
            
            
            ScrollView {
                transactionViewCell()
                transactionViewCell()
                transactionViewCell()
                transactionViewCell()
            }
            
            
            
            //                Spacer()
        }
        
    }
}




#Preview {
    HomeView()
}

struct transactionViewCell: View {
    var body: some View {
        HStack (spacing:10){
            
            IconWIthBackgroundCell(iconName: "shopping-bag", themeColor: Color.CustomBlue, heightWidth: 40)
            
            VStack (alignment: .leading,spacing:5){
                Text("Shopping")
                    .font(.subheadline)
                    .fontWeight(.medium)
                Text("Buy some grocery")
                    .font(.system(size: 15))
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            VStack {
                Text("-$120")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                Text("10:00 AM")
                    .font(.system(size: 15))
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
            }
        }
        .padding(.all,15)
        .overlay{
            RoundedRectangle(cornerRadius: 20) // Corrected to use cornerRadius
                .fill(Color.gray.opacity(0.03))
        }
        //        .padding(.vertical,10)
        //        .background(
        //            Color.white.cornerRadius(20)
        //        )
        //        .shadow(radius: 5)
        //        .padding(.horizontal,20)
    }
}

struct pillView: View {
    
    @State var pillColor: Color
    @State var pillTextColor : Color
    @State var title : String
    
    var body: some View {
        Text(title)
            .fontWeight(.semibold)
            .foregroundColor(pillTextColor)
            .font(.subheadline)
            .padding(.vertical,7)
            .padding(.horizontal,25)
            .background(
                pillColor.cornerRadius(15)
            )
    }
}


