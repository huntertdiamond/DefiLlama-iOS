//
//  stablecoinSheetViewModel.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/10/23.
//

import Foundation


final class StablecoinSheetViewModel {
    static let shared = StablecoinSheetViewModel()
    private init() {}
    
    func getDominance(for totalMarketCap: Double, singleMarketCap: Double) -> Double {
        return singleMarketCap / totalMarketCap
    }
    func calculateStablcoinTotalValue(of assets: [PeggedAsset]) -> Double {
        return assets.reduce(0) { (total, asset) in
            total + (asset.circulating?.peggedUSD ?? 0)
        }
    }

}
