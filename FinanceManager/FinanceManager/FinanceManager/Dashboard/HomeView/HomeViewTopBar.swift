//
//  HomeViewTopBar.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 28/9/24.
//

import SwiftUI

struct HomeViewTopBar: View {
    var body: some View {
        HStack(alignment: .center){
            Image("dp")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .padding(.horizontal,20)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.purple, lineWidth: 2))
            
            Spacer()
            
            HStack {
                Image("dropDown")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .fontWeight(.bold)
                    .frame(width: 20, height: 20)
                    .font(.subheadline)
                Text("September 2024")
                    .font(.title2)
                    .foregroundColor(.black)
                    .fontWeight(.thin)
            }
            .padding(.all, 10)
            .background(Color.white) // Optional: Add a background color to make it stand out
            .cornerRadius(10) // Apply corner radius to the HStack itself
            .overlay(
                RoundedRectangle(cornerRadius: 10) // Corrected to use cornerRadius
                    .stroke(Color.gray, lineWidth: 0.3)
            )
            // Green stroke
            
            Spacer()
            
            Image("notification")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
                .padding(.horizontal,20)
            
        }
        .foregroundColor(Color.red)
    }
}
#Preview {
    HomeViewTopBar()
}
