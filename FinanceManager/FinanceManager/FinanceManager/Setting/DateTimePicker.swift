//
//  DateTimePicker.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 23/9/24.
//

import SwiftUI

struct DateTimePicker: View {
    
    @State var selectedDate = Date()
    
    var body: some View {
        
        DatePicker("Select a Date",selection: $selectedDate,in: Date()... ,displayedComponents: [.date, .hourAndMinute])
    }
}

#Preview {
    DateTimePicker()
}
