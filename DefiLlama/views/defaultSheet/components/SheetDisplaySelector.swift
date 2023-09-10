//
//  SheetDisplaySelector.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/10/23.
//

import Foundation
import SwiftUI


struct MainSheetDisplaySelector: View {
    @Binding var selectedCategory: Categories
    @State private var isMenuPresented: Bool = false

    var body: some View {
        VStack {
            Menu {
                ForEach(Categories.allCases, id: \.self) { category in
                    Button(action: {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        selectedCategory = category
                        isMenuPresented = false

                    }) {
                        Text(category.rawValue)
                    }
                }
            }
             label: {
                HStack {
                    Text(selectedCategory.rawValue)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Image(systemName: isMenuPresented ? "chevron.up" : "chevron.down")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
                .foregroundColor(Color.textPrimary)
                .onTapGesture {
                    isMenuPresented = true
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()

                }
            }
        }
    }
}


enum Categories: String, CaseIterable {
    case protocolRankings = "Protocol Rankings"
    case chainRanking = "Chains"
    case yields = "Yields"
    case coins = "Coins"
    case stablecoinData = "Stablecoins"
}
