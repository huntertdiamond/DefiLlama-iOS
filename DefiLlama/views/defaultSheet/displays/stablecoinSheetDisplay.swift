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
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 4){
                if selectedDetent == .fraction(0.6) || selectedDetent == .fraction(1) {
                    StablecoinSorter()
                }
                ForEach(stableCoinData, id: \.id) { stable in
                    StableCoinPreviewContainer(displayedStable: stable)
                }
            }
        }
        .onAppear {
            Task{
                
                do {
                    let stablecoinOwner = try await StablecoinDataManager.shared.fetchStablecoinTVL()
                    self.stableCoinData = MainViewViewModel.shared.filterStablecoinData(for: stablecoinOwner)
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
        StablecoinSheetDisplay(selectedDetent: .constant(.fraction(0.25)))
        
    }
}


struct StablecoinSorter: View {
    @State private var selectedOption: StablecoinSortingOptions? = .totalCirculation
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(StablecoinSortingOptions.allCases, id: \.self) { option in
                    StablecoinSorterChip(option: option, selectedOption: $selectedOption)
                        .onTapGesture {
                            if selectedOption == option {
                                selectedOption = nil
                            } else {
                                selectedOption = option
                            }
                        }
                }
            }
        }
    }
}

struct StablecoinSorterChip: View {
    var option: StablecoinSortingOptions
    @Binding var selectedOption: StablecoinSortingOptions?
    
    var body: some View {
        HStack {
            if selectedOption == option {
                Image(systemName: "arrow.down")
            }
            Text(option.rawValue)
        }
        .padding(6)
        .background(selectedOption == option ? Color.ourBlueLight : Color.l1)
        .cornerRadius(12)
        .foregroundColor(selectedOption == option ? Color.ourBlue : Color.textPrimary)
    }
}



enum StablecoinSortingOptions: String, CaseIterable {
    case totalCirculation = "Market Cap"
    case price = "Price"
    case percentOffPeg = "% off Peg"
    case percentOfTotal = "Dominance"
}
