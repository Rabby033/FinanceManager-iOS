//
//  BudgetSetItem.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 25/9/24.
//

import SwiftUI

struct BudgetSetItemView: View {
    var body: some View {
        VStack (alignment: .leading){
            HStack(spacing: 0){
                
                Image("accountIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .background(Circle().fill(Color.white)) // Background circle, optional
                    .overlay(
                        Circle()
                            .stroke(Color.green, lineWidth: 1.5) // Green stroke
                    )
                
                VStack(alignment:.leading,spacing: 5) {
                    Text("Shoping")
                        .fontWeight(.light)
                        .font(.title3)
                        .padding(.leading,0)
                    
                    var random = Int.random(in: 0..<6)
                    if random % 2 == 0 {
                        progressBarBudgetView()
                    } else {
                        budgetNotSetView()
                    }
                }
                .padding(.leading)
                
                Spacer()
                
                //                Button(action: {
                //                    Menu {
                //                        Button("Open in Preview", action: {})
                //                        Button("Save as PDF", action: {})
                //                    } label: {
                //                        Label("PDF", systemImage: "doc.fill")
                //                    }
                //                }, label: {
                //                                    Image(systemName: "ellipsis")
                //                                        .font(.title)
                //                                        .padding(.trailing,10)
                //                                        .foregroundColor(.green)
                //                })
                Menu {
                    
                    
                    Button(action: {
                        // Your action for the second item
                    }, label: {
                        HStack(spacing: 8) {
                            Image(systemName: "trash") // Another icon for the second item
                                .foregroundColor(.red) // Optional: customize icon color
                            Text("Remove Budget")
                        }
                        .padding(8) // Add padding for touch targets
                    })
                    
                    Button(action: {
                        // Your action for the first item
                    }, label: {
                        HStack(spacing: 8) {
                            Image(systemName: "square.and.pencil") // Your icon
                                .foregroundColor(.blue) // Optional: customize icon color
                            Text("Edit Budget")
                        }
                        .padding(8) // Add padding for touch targets
                    })
                    
                    // Add more buttons as needed without separators
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.title)
                        .padding(.trailing, 10)
                        .foregroundColor(.green)
                }


                
                
            }
            .frame(maxWidth: .infinity)
            .padding(.leading,5)
            
        }
        .padding(5)
    }
}




struct budgetNotSetView : View {
    var body: some View {
        Text("Not set yet")
            .foregroundColor(.green).opacity(0.7)
    }
}

struct progressBarBudgetView : View {
    @State var progress : CGFloat = 0.7
    var totalWidth: CGFloat = 120
    var dashspacing: CGFloat = 1.5
    var dashWidth : CGFloat = 5
    
    var body: some View {
        HStack {
            
            
            ZStack(alignment: .leading){
                
                Rectangle().stroke(lineWidth: 2)
                    .frame(width: totalWidth + 5, height: 15)
                
                HStack(spacing:dashspacing){
                    ForEach(0..<Int((totalWidth*progress)/(dashWidth+dashspacing)),id: \.self){ item in
                        Rectangle()
                            .frame(width: dashWidth,height: 10)
                    }
                }
            }
            
            Text("70%")
            
        }
        .foregroundColor(.green)
    }
}

#Preview {
    BudgetSetItemView()
}
