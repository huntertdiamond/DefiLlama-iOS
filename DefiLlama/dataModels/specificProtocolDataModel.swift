import Foundation

// MARK: - SingleProtocol
struct SingleProtocol: Decodable {
    let id, name: String?
    let address: String?
    let url: String?
    let description: String?
    let logo: String?
    let chains: [String?]?
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
    let hallmarks: [[ProtocolHallmarkElement]]?
    
    init() {
        self.id = nil
        self.address = nil
        self.name = nil
        self.url = nil
        self.description = nil
        self.logo = nil
        self.chains = nil
        self.geckoID = nil
        self.cmcID = nil
        self.treasury = nil
        self.twitter = nil
        self.governanceID = nil
        self.wrongLiquidity = nil
        self.github = nil
        self.currentChainTvls = nil
        self.chainTvls = nil
        self.tokens = nil
        self.tokensInUsd = nil
        self.tvl = nil
        self.isParentProtocol = nil
        self.raises = nil
        self.metrics = nil
        self.symbol = nil
        self.mcap = nil
        self.otherProtocols = nil
        self.hallmarks = nil
    }
}

// MARK: - ChainTvl
struct ChainTvl: Decodable {
    let tvl: [Tvl]?
    let tokens: [Token]
    let tokensInUsd: [Token]?
    
    init() {
        self.tvl = nil
        self.tokens = []
        self.tokensInUsd = nil
    }
}
enum ProtocolHallmarkElement: Decodable {
    case int(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let intValue = try? container.decode(Int.self) {
            self = .int(intValue)
        } else if let stringValue = try? container.decode(String.self) {
            self = .string(stringValue)
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Mismatched Types")
        }
    }
}

struct ProtocolHallmark {
    let date: Int
    let context: String
}

// MARK: - Tvl
struct Tvl: Decodable {
    let date: Int?
    let totalLiquidityUSD: Double?
    
    init() {
        self.date = nil
        self.totalLiquidityUSD = nil
    }
}

struct tokensInUsd: Decodable {
    let date: Double
    let tokens: [Token]
}

// MARK: - Metrics
struct Metrics: Decodable {
    let placeholder: String?
    
    init() {
        self.placeholder = nil
    }
}

// MARK: - Raise
struct Raise: Decodable {
    let date: Int?
    let name, round: String?
    let amount: Double?
    let chains: [String]?
    let sector, category: String?
    let source: String?
    let leadInvestors: [String]?
    let otherInvestors: [String?]?
    let valuation: Int?
    let defillamaID: String?
    
    init() {
        self.date = nil
        self.name = nil
        self.round = nil
        self.amount = nil
        self.chains = nil
        self.sector = nil
        self.category = nil
        self.source = nil
        self.leadInvestors = nil
        self.otherInvestors = nil
        self.valuation = nil
        self.defillamaID = nil
    }
}

// MARK: - Token
struct Token: Decodable {
    let date: Int?
    let tokens: [String: Double]?
    
    init() {
        self.date = nil
        self.tokens = nil
    }
}


