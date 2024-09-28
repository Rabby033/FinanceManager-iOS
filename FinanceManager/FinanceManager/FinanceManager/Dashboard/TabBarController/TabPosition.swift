//
//  TabPosition.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 22/9/24.
//

import SwiftUI

struct TabPosition: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect , nextValue: () -> CGRect ) {
        value = nextValue()
    }
}
