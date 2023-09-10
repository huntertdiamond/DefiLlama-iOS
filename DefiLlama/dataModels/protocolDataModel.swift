//
//  ProtocolDataModel.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import Foundation


// MARK: - ProtocolElement
struct MainProtocolElement: Codable {
    let id, name: String
    let address: String?
    let symbol: String
    let url: String
    let description: String?
    let chain: String
    let logo: String
    let audits: String?
    let auditNote: String?
    let geckoID, cmcID: String?
    let category: ProtocolCategory
    let chains: [String]
    let module: String
    let twitter: String?
    let forkedFrom, oracles: [String]?
    let listedAt: Int?
    let slug: String
    let tvl: Double
    let chainTvls: [String: Double]
    let change1H, change1D, change7D: Double?
    let tokenBreakdowns: TokenBreakdowns
    let mcap: Double?
    let referralURL: String?
    let treasury: String?
    let auditLinks: [String]?
    let openSource: Bool?
    let governanceID, github, stablecoins: [String]?
    let parentProtocol: String?
    let wrongLiquidity: Bool?
    let staking, pool2: Double?
    let assetToken, language: String?
    let oraclesByChain: [String: [String]]?
    let deadURL, rugged: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name, address, symbol, url, description, chain, logo, audits
        case auditNote
        case geckoID
        case cmcID
        case category, chains, module, twitter, forkedFrom, oracles, listedAt, slug, tvl, chainTvls
        case change1H = "change_1h"
        case change1D = "change_1d"
        case change7D = "change_7d"
        case tokenBreakdowns, mcap
        case referralURL
        case treasury
        case auditLinks
        case openSource, governanceID, github, stablecoins, parentProtocol, wrongLiquidity, staking, pool2, assetToken, language, oraclesByChain
        case deadURL
        case rugged
    }
}

enum ProtocolCategory: String, Codable {
    case algoStables = "Algo-Stables"
    case bridge = "Bridge"
    case cdp = "CDP"
    case cex = "CEX"
    case chain = "Chain"
    case crossChain = "Cross Chain"
    case decentralizedStablecoin = "Decentralized Stablecoin"
    case derivatives = "Derivatives"
    case dexes = "Dexes"
    case farm = "Farm"
    case gaming = "Gaming"
    case indexes = "Indexes"
    case insurance = "Insurance"
    case launchpad = "Launchpad"
    case lending = "Lending"
    case leveragedFarming = "Leveraged Farming"
    case liquidStaking = "Liquid Staking"
    case liquidityManager = "Liquidity manager"
    case nftLending = "NFT Lending"
    case nftMarketplace = "NFT Marketplace"
    case options = "Options"
    case optionsVault = "Options Vault"
    case oracle = "Oracle"
    case payments = "Payments"
    case predictionMarket = "Prediction Market"
    case privacy = "Privacy"
    case reserveCurrency = "Reserve Currency"
    case rwa = "RWA"
    case rwaLending = "RWA Lending"
    case services = "Services"
    case stakingPool = "Staking Pool"
    case synthetics = "Synthetics"
    case uncollateralizedLending = "Uncollateralized Lending"
    case yield = "Yield"
    case yieldAggregator = "Yield Aggregator"
}
// MARK: - TokenBreakdowns
struct TokenBreakdowns: Codable {
}
