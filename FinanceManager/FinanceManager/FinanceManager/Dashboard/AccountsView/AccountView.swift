//
//  AccountView.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 23/9/24.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        VStack {
            HStack {
                Text("All Account Total:")
                Text("$7,898,898.90")
                    .fontWeight(.bold)
                    .foregroundColor(.green)
            }
            .padding(.top)

            HStack(spacing: 50) {
                VStack {
                    Text("EXPENSE SO FAR")
                    Text("$1,310.00")
                        .foregroundColor(.red)
                }
                
                VStack {
                    Text("INCOME SO FAR")
                    Text("$1,310.00")
                        .foregroundStyle(.green)
                }
            }
            .padding(.top, 5)

            Divider()
                .frame(height: 3)
                .background(Color.green.gradient.opacity(0.2))

            ScrollView {
                LazyVStack {
                    Section(header: Text("Account")
                        .fontWeight(.bold)
                        .foregroundColor(.green)) {
                        ForEach(0..<3) { index in
                            AccountViewItem()
                            Divider()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AccountView()
}
