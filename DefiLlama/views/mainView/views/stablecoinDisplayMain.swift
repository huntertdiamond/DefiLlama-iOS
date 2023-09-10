//
//  stablecoinDisplayMain.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/10/23.
//

import SwiftUI

struct StablecoinDisplayMain: View {
    @State var stableCoinData: [PeggedAsset] = []
    var body: some View {
        VStack{
            Text("howdy")
        }
        .task {
            do {
                let stablecoinOwner = try await StablecoinDataManager.shared.fetchStablecoinTVL()
                self.stableCoinData = MainViewViewModel.shared.filterStablecoinData(for: stablecoinOwner)
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
