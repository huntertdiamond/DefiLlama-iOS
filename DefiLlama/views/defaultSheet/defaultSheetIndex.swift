//
//  defaultSheetIndex.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import SwiftUI

struct PrimarySheetIndex: View {
    @Binding var selectedDetent: PresentationDetent
    
    @State var searchText: String = ""
    @EnvironmentObject var selectedCategory: SelectedCategory
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            MainSheetHeader()
            SearchBar(text: $searchText)
            if selectedCategory.category == .protocolRankings {
                ProtocolSheetDisplay()
            }
            if selectedCategory.category == .stablecoinData {
                StablecoinSheetDisplay(selectedDetent: $selectedDetent)
            }
        }
        .padding()
    }
}

struct DefaultSheetIndex_Previews: PreviewProvider {
    static var searchText: String = ""

    static var previews: some View {
        PrimarySheetIndex(selectedDetent: .constant(.fraction(0.25)))
            .environmentObject(SelectedCategory())  // Provide an EnvironmentObject here for the preview
    }
}
