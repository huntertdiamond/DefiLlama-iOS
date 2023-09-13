//
//  mainViewIndex.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import SwiftUI

struct MainViewIndex: View {
    @State private var tvlData: [TVLData] = []
    @EnvironmentObject var selectedChain: SelectedChain

    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading, spacing: 8){
                if !tvlData.isEmpty {
                    let lastTVL = tvlData.last?.tvl
                    MainViewHeader(displayedTVL: lastTVL ?? 0)
                    TVLChart(tvlData: tvlData)
                } else {
                    MainViewPreLoader()
                }

                Spacer()
            }
        }
        .onAppear {
            loadTVLData()
        }
        .onChange(of: selectedChain.displayedChain) { newValue in
            print("displayedChain changed to: \(newValue)")

               loadTVLData()
           }
    }
    
    func loadTVLData() {
        Task {
            do {
                if selectedChain.displayedChain == .all {
                    self.tvlData = try await ChainDataManager.shared.fetchAllTVL()
                } else {
                    self.tvlData = try await ChainDataManager.shared.fetchTVLByChainSlug(for: selectedChain.displayedChain.rawValue)
                }
            } catch {
                // Handle error here, e.g., showing an alert to the user
                print("Error fetching TVL data: \(error)")
            }
        }
    }
}

struct mainViewIndex_Previews: PreviewProvider {
    static var previews: some View {
        MainViewIndex()
            .environmentObject(SelectedChain())

    }
}



