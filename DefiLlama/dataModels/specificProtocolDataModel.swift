
import Foundation

// MARK: - SingleProtocol
struct SingleProtocol {
    let id, name: String?
    let url: String?
    let description: String?
    let logo: String?
    let chains: [Any?]?
    let geckoID, cmcID, treasury, twitter: String?
    let governanceID: [String]?
    let wrongLiquidity: Bool?
    let github: [String]?
    let currentChainTvls: [String: Double]?
    let chainTvls: [String: ChainTvl]?
    let tokens, tokensInUsd: [Token]?
    let tvl: [Tvl]?
    let isParentProtocol: Bool?
    let raises: [Raise]?
    let metrics: Metrics?
    let symbol: String?
    let mcap: Double?
    let otherProtocols: [String]?
    let hallmarks: [[Hallmark]]?
}

// MARK: - ChainTvl
struct ChainTvl {
    let tvl: [Tvl]?
    let tokens, tokensInUsd: NSNull?
}

// MARK: - Tvl
struct Tvl {
    let date: Int?
    let totalLiquidityUSD: Double?
}

enum Hallmark {
    case integer(Int)
    case string(String)
}

// MARK: - Metrics
struct Metrics {
}

// MARK: - Raise
struct Raise {
    let date: Int?
    let name, round: String?
    let amount: Double?
    let chains: [String]?
    let sector, category: String?
    let source: String?
    let leadInvestors: [String]?
    let otherInvestors: [Any?]?
    let valuation: NSNull?
    let defillamaID: String?
}

// MARK: - Token
struct Token {
    let date: Int?
    let tokens: [String: Double]?
}
