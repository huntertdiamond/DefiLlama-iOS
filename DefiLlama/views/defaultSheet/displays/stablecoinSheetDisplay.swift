//
//  stablecoinSheetDisplay.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/10/23.
//

import SwiftUI

struct StablecoinSheetDisplay: View {
    @State var stableCoinData: [PeggedAsset] = []
    @State var stablecoinTotalValue: Double = 89
    @Binding var selectedDetent: PresentationDetent
    @State  var selectedSortingOption: StablecoinSortingOptions = .totalCirculation
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 4) {
                if selectedDetent == .fraction(0.6) || selectedDetent == .fraction(1) {
                    StablecoinSorter(selectedOption: $selectedSortingOption)
                }
                ForEach(stableCoinData.sorted(by: selectedSortingOption.sortingFunction), id: \.id) { stable in
                    StableCoinPreviewContainer(displayedStable: stable)
                }
            }
        }
        .onAppear {
            Task {
                do {
                    self.stableCoinData = try await StablecoinDataManager.shared.fetchStablecoinTVL()
                    self.stablecoinTotalValue = MainViewViewModel.shared.calculateStablcoinTotalValue(of: stableCoinData)
                    print(stablecoinTotalValue)
                }
                catch {
                    
                }
            }
        }
    }
}
struct stablecoinSheetDisplay_Previews: PreviewProvider {
    static var previews: some View {
        StablecoinSheetDisplay(selectedDetent: .constant(.fraction(0.6)))
        
    }
}


struct StablecoinSorter: View {
    @Binding  var selectedOption: StablecoinSortingOptions
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(StablecoinSortingOptions.allCases, id: \.self) { option in
                    StablecoinSorterChip(option: option, selectedOption: $selectedOption)
                        .onTapGesture {
                            selectedOption = option
                        }
                }
            }
        }
    }
}

struct StablecoinSorterChip: View {
    var option: StablecoinSortingOptions
    @Binding var selectedOption: StablecoinSortingOptions
    
    var body: some View {
        HStack {
            if selectedOption == option {
                Image(systemName: "arrow.down")
            }
            Text(option.rawValue)
        }
        .padding(6)
        .background(selectedOption == option ? Color.ourBlueLight : Color.sheetL1)
        .cornerRadius(12)
        .foregroundColor(selectedOption == option ? Color.ourBlue : Color.textPrimary)
    }
}


enum StablecoinSortingOptions: String, CaseIterable {
    case totalCirculation = "Market Cap"
    case price = "Price"
    case percentOffPeg = "% off Peg"
    case noOfChains = "# of Chains"
    
    var sortingFunction: (PeggedAsset, PeggedAsset) -> Bool {
        switch self {
        case .totalCirculation:
            return { ($0.circulating?.peggedUSD ?? 0) > ($1.circulating?.peggedUSD  ?? 0) }
        case .price:
            return { ($0.price ?? 0) > ($1.price ?? 0) }
        case .percentOffPeg:
            return { $0.percentOffPeg > $1.percentOffPeg }
        case .noOfChains:
            return { $0.noOfChains > $1.noOfChains }
        }
    }
}
