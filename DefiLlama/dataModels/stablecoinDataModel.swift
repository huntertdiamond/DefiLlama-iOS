//
//  stablecoinDataModel.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/10/23.
//

import Foundation

struct StablecoinOwner: Codable {
    let peggedAssets: [PeggedAsset]
}


struct PeggedAsset: Codable {
    let id, name, symbol, geckoID: String?
    let pegType: PegType?
    let priceSource: PriceSource?
    let pegMechanism: PegMechanism?
    let circulating: CirculatingData?
    let circulatingPrevDay: CirculatingData?
    let circulatingPrevWeek: CirculatingData?
    let circulatingPrevMonth: CirculatingData?
    let chainCirculating: [String: CirculatingData?]?
    let chains: [String]?
    let delisted: Bool?
}

struct CirculatingData: Codable {
    let peggedUSD: Double?
    let peggedEUR: Double?
    let peggedJPY: Double?
    let peggedCNY: Double?
    let peggedVAR: Double?
    let circulatingPrevMonth: Int?
}

enum PegMechanism: String, Codable {
    case algorithmic
    case cryptoBacked
    case fiatBacked
}

enum PegType: String, Codable {
    case peggedCNY
    case peggedEUR
    case peggedJPY
    case peggedUSD
    case peggedVAR
}

enum PriceSource: String, Codable {
    case coingecko
    case defillama
}
