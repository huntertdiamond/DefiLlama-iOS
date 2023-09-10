//
//  chainTabSelector.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import Foundation
import SwiftUI

struct ChainTab: View {
    let title: String
    var isSelected: Bool
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(isSelected ? Color.ourBlue : Color.textPrimary)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(isSelected ? Color.ourBlueLight : Color.l1)
        .cornerRadius(8)
        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.borderLight, lineWidth: 1))
    }
}

struct ChainTabSelector: View {
    @State private var selectedTab: BigTenChains = .all // Assume you have 'all' enum case in your BigTenChains enum
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(BigTenChains.allCases, id: \.self) { chain in
                    ChainTab(title: chain.rawValue, isSelected: chain == selectedTab)
                        .onTapGesture {
                            selectedTab = chain
                        }
                }
            }
        }
    }
}

