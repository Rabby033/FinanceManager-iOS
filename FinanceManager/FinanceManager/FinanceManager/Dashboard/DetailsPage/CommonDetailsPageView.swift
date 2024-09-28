//
//  CommonDetailsPageView.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 28/9/24.
//

import SwiftUI

struct CommonDetailsPageView: View {
    
    @State var amount: String
    var body: some View {
        
        ZStack {
            
            Color.CustomRed.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack(spacing: 0){
                DetailsPageNavigationBar()
                
                Spacer()
                amountInputview(amount: $amount)
                
                //                Spacer()
                
                DetailsPageInformationView()
            }
        }
    }
}

#Preview {
    CommonDetailsPageView(amount: "")
}

struct DetailsPageNavigationBar: View {
    var body: some View {
        HStack (alignment: .center,spacing: 20){
            Image("arrow-left")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.white)
                .frame(width: 45, height: 45)
                .padding(.leading,15)
            
            Spacer()
            
            Text("Expense")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Spacer()
            
            Image("arrow-left2")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.white)
                .frame(width: 45, height: 45)
                .padding(.trailing,15)
        }
        .padding(.top,5)
    }
}

struct amountInputview: View {
    
    @Binding var amount: String
    
    var body: some View {
        VStack (alignment: .leading,spacing: 5){
            Text("How much?")
                .font(.system(size: 40))
                .fontWeight(.bold)
                .foregroundColor(.white.opacity(0.95))
            
            TextField(text: $amount, label: {
                Text("Enter amount..")
                    .font(.system(size: 25))
                    .foregroundColor(Color.white.opacity(0.5))
                    .underline()
            })
        }
        .padding(.leading,20)
        .padding(.top,50)
    }
}

struct DetailsPageInformationView: View {
    var body: some View {
        
        ZStack {
            Color.white
            
            
            ScrollView {
                VStack (spacing: 20){
                    IndividualCellView(fieldName: "Category", iconName: "dropDown")
                    IndividualCellView(fieldName: "Description", iconName: "dropDown")
                    IndividualCellView(fieldName: "Wallet", iconName: "dropDown")
                    Spacer()
                }
                .padding(.top,20)
            }
            
            
            
            
        }
        .cornerRadius(40)
        .ignoresSafeArea()
        .padding(.top,50)
        .frame(width: .infinity)
        .padding(.bottom,0)
    }
}


struct IndividualCellView: View {
    
    var fieldName: String
    var iconName: String
    
    
    var body: some View {
        HStack{
            Text(fieldName)
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.gray)
            
            Spacer()
            
            Image(iconName)
                .resizable()
                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                .foregroundColor(.gray)
                .aspectRatio(contentMode: .fit)
                .fontWeight(.bold)
                .frame(width: 20, height: 20)
        }
        .padding(.all,20)
        .background(
            RoundedRectangle(cornerRadius: 20).stroke(Color.gray.opacity(0.5),lineWidth: 2)
        )
        .padding(.horizontal)
    }
}
