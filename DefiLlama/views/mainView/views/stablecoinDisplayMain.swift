//
//  stablecoinDisplayMain.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/10/23.
//

import SwiftUI

struct StablecoinDisplayMain: View {
    @State var stableCoinData: [PeggedAsset] = []
    @State var stablecoinTotalValue: Double = 89
    var body: some View {
        VStack{
            Text("$\(FormatNumbers.shared.abbreviateDoubles(for: stablecoinTotalValue))")
        }
        .task {
            do {
                let stablecoinOwner = try await StablecoinDataManager.shared.fetchStablecoinTVL()
                self.stableCoinData = MainViewViewModel.shared.filterStablecoinData(for: stablecoinOwner)
                self.stablecoinTotalValue = MainViewViewModel.shared.calculateStablcoinTotalValue(of: stableCoinData)
            }
            catch {
                
            }
        }
    }
}

struct stablecoinDisplayMain_Previews: PreviewProvider {
    static var previews: some View {
        StablecoinDisplayMain()
    }
}
