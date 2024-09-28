//
//  RecordsView.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 22/9/24.
//

import SwiftUI

struct RecordsView: View {
    var body: some View {
        
        VStack {
            HStack (spacing: 30) {
                
                Image(systemName: "arrowtriangle.backward.fill")
                    .font(.title3)
                    .foregroundColor(.green)
                
                Text("September, 2024")
                    .fontWeight(.regular)
                    .foregroundColor(.green)
                    .font(.title3)
                
                Image(systemName: "arrowtriangle.forward.fill")
                    .font(.title3)
                    .foregroundColor(.green)
            }
            
            HStack (spacing: 50){
                VStack {
                    Text("EXPENSE")
                    Text("$1,310.00")
                        .foregroundColor(.red)
                }
                
                VStack {
                    Text("INCOME")
                    Text("$1,310.00")
                        .foregroundStyle(.green)
                }
                
                VStack {
                    Text("NET ")
                    Text("$1,310.00")
                        .foregroundColor(.red)
                }
            }
            .padding(.top,5 )
            
            Divider()
            Spacer()
            
            //            ScrollView{
            //                ForEach(0..<20){ index in
            //                    RecordsItem()
            //                    Divider()
            //                }
            //            }
            ScrollView {
                LazyVStack{
                    Section(header: Text("27 september")){
                        ForEach(0..<20){ index in
                            RecordsItem()
                            Divider()
                        }
                    }
                }
            }
            
            
        }
        .padding(.top,20)
        
//        Spacer()
        
    }
}

#Preview {
    RecordsView()
}
