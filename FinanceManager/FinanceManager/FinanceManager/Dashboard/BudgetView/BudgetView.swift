//
//  BudgetView.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 23/9/24.
//

import SwiftUI

struct BudgetView: View {

    var body: some View {
        VStack {

            HStack(spacing: 50) {
                VStack {
                    Text("BUDGET SO FAR")
                    Text("$1,310.00")
                        .foregroundColor(.red)
                }

                VStack (alignment: .leading){
                    Text("EXPENSE SO FAR")

                    Text("$1,310.00")
                        .foregroundStyle(.green)
                }
            }
            .padding(.top, 5)

            ScrollView {
                LazyVStack (pinnedViews:[.sectionHeaders]){
                    Section(header: Text("Budget not set").frame(maxWidth: .infinity)
                        .background(Color.white)

                        .fontWeight(.bold)
                        .foregroundColor(.green)) {
                            ForEach(0..<3) { index in
                                BudgetSetItemView()
                                Divider()
                            }
                            ForEach(0..<3) { index in
                                BudgetSetItemView()
                                Divider()
                            }
                        }
                }
            }
        }
    }
}




#Preview {
    BudgetView()
}
