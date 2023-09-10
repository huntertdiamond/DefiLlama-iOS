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

}
