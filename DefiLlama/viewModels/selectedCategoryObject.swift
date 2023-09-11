//
//  selectedCategoryObject.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/10/23.
//

import SwiftUI

class SelectedCategory: ObservableObject {
    @Published var category: Categories = .protocolRankings
}
class SelectedChain: ObservableObject {
    @Published var displayedChain: BigTenChains = .all
}
