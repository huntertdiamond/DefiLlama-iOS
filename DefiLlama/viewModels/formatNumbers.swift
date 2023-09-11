//
//  formatNumbers.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import SwiftUI

final class FormatNumbers {
    static let shared = FormatNumbers()
    
    private init() {}
    
    func abbreviateDoubles(for price: Double) -> String {
        let billion = price / 1_000_000_000
        let million = (price.truncatingRemainder(dividingBy: 1_000_000_000)) / 1_000_000
        let thousand = (price.truncatingRemainder(dividingBy: 1_000_000)) / 1_000
        
        if billion >= 1.0 {
            return String(format: "%.2fB", billion)
        } else if million >= 1.0 {
            return String(format: "%.2fM", million)
        } else if thousand >= 1.0 {
            return String(format: "%.2fK", thousand)
        } else {
            return String(format: "%.2f", price)
        }
    }
    func abbreviateInt(for price: Int) -> String {
        let billion = price / 1_000_000_000
        let million = (price % 1_000_000_000) / 1_000_000
        let thousand = (price % 1_000_000) / 1_000
        
        if billion >= 1 {
            return "\(billion)B"
        } else if million >= 1 {
            return "\(million)M"
        } else if thousand >= 1 {
            return "\(thousand)K"
        } else {
            return "\(price)"
        }
    }

    func addPercentageSign(for percent: Double) -> String {
        return String(format: "%.2f%%", percent)
    }
}
