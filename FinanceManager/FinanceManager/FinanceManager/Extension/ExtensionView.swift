//
//  ExtensionView.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 8/10/24.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    func hideKeyboardOnTap() -> some View {
        self.onTapGesture {
            self.hideKeyboard()
        }
    }
}
