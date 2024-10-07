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
            
            VStack {
                
                    transactionViewCell()
                    transactionViewCell()
                    transactionViewCell()
                    transactionViewCell()
                    transactionViewCell()
            }
        }
    }
}

#Preview {
    RecordsView()
}
