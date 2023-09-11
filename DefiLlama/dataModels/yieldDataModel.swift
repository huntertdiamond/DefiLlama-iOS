//
//  yieldDataModel.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/10/23.
//

import Foundation


// MARK: - YieldOwner
struct YieldOwner: Codable {
    let status: String?
    let data: [ProtocolYieldItem]?
}

// MARK: - Datum
struct ProtocolYieldItem: Codable {
    let chain: AllChains?
    let project, symbol: String?
    let tvlUsd: Int?
    let apyBase, apyReward: Double?
    let apy: Double?
    let rewardTokens: [String]?
    let pool: String?
    let apyPct1D, apyPct7D, apyPct30D: Double?
    let stablecoin: Bool?
    let ilRisk: ILRisk?
    let exposure: Exposure?
    let predictions: Predictions?
    let poolMeta: String?
    let mu, sigma: Double?
    let count: Int?
    let outlier: Bool?
    let underlyingTokens: [String]?
    let il7D, apyBase7D: Double?
    let apyMean30D: Double?
    let volumeUsd1D, volumeUsd7D, apyBaseInception: Double?
}

enum Exposure: String,  Codable {
    case multi
    case single
}

enum ILRisk: String,  Codable {
    case no
    case yes
}

// MARK: - Predictions
struct Predictions:  Codable {
    let predictedClass: PredictedClass?
    let predictedProbability: Double?
    let binnedConfidence: Int?
}

enum PredictedClass: String, Codable {
    case down = "Down"
    case stableUp = "Stable/Up"
}
