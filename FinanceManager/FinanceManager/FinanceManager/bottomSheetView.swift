//
//  bottomSheetView.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 30/9/24.
//

import SwiftUI

struct BasicBottomSheet: View {
   @State private var showSheet = false

   var body: some View {
       VStack {
           Button("Show Bottom Sheet") {
               showSheet.toggle()
           }
           .buttonStyle(.borderedProminent)
           .sheet(isPresented: $showSheet) {
               HomeView()
                   .presentationDetents([.medium, .large])
           }

           Spacer()
       }
   }
}
#Preview {
    BasicBottomSheet()
}
