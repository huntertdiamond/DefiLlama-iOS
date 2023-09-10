//
//  mainViewDataManager.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/10/23.
//

import Foundation


final class MainViewViewModel {
    static let shared =  MainViewViewModel()
    private init() {}
    
    
    func filterStablecoinData(for stablecoinOwner: StablecoinOwner) -> [PeggedAsset] {
        return stablecoinOwner.peggedAssets ?? []
    }
    func calculateStablcoinTotalValue(of assets: [PeggedAsset]) -> Double {
        return assets.reduce(0) { (total, asset) in
            total + (asset.circulating?.peggedUSD ?? 0)
        }
    }

}
