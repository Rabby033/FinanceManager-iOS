//
//  utilityFunction.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 3/10/24.
//

import Foundation
import SwiftUI

public class utilityFunction {
    func getThemeColor(pageType: DetailsPageEnum) -> Color {
        switch pageType {
        case .EXPENSE:
            return Color.CustomRed
        case .INCOME :
            return Color.CustomGreen
        case .MONEY_TRANSFER:
            return Color.CustomBlue
        default:
            return Color.CustomBlue
        }
    }
}
