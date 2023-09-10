import Foundation

struct StablecoinOwner: Codable {
    let peggedAssets: [PeggedAsset]?
}

struct PeggedAsset: Codable {
    let id, name, symbol, geckoID: String?
    let pegType: PegType?
    let priceSource: PriceSource?
    let pegMechanism: PegMechanism?
    let circulating, circulatingPrevDay, circulatingPrevWeek: Circulating?
    let circulatingPrevMonth: CirculatingPrevMonth?
    let chainCirculating: ChainCirculating?
    let chains: [String]?
    let delisted: Bool?
}

struct Circulating: Codable {
    let peggedUSD, peggedVAR, peggedEUR, peggedJPY: Double?
    let peggedCNY: Double?
}

struct ChainCirculating: Codable {
    let optimism, statemine, harmony, thunderCore, bsc: CirculatingType?
    let dogechain, astar, oasis, heco, shiden, telos, arbitrum, tron, tomoChain, zkSyncLite, zilliqa, evmos, arbitrumNova, milkomedaC1, sXnetwork, aptos, rsk, tezos, moonbeam, aurora, loopring, algorand, polygon, defiChain, canto, metis, wanchain, kava, ontology, moonriver, liquidchain, mixin, avalanche, klaytn, meter, reiNetwork, ioTeX, ethereum, gnosis, ethereumClassic, omni, celo, fuse, fantom, okExChain, kardia, terraClassic, kcc, near, eos, crab, bittorrent, boba, theta, neo, syscoin, solana, everscale, dfk, kadena, flow, zkSyncEra, hedera, stellar, karura, osmosis, polygonZkEVM, base, elastos, ronin, multiversX, velas, starkNet, aztec, waves, smartBCH, cronos, conflux, acala, linea, ergo, kujira, ethereumPoW, cardano, comdex, secret: CirculatingType?
}

typealias CirculatingType = CirculatingGroup<CirculatingPrevDay>
typealias CirculatingPrevMonth = CirculatingPrevMonthType<CirculatingPrevDay>


struct CirculatingGroup<T: Codable>: Codable {
    let current, circulatingPrevDay, circulatingPrevWeek: T?
    let circulatingPrevMonth: CirculatingPrevMonthType<T>?
}

struct CirculatingPrevDay: Codable {
    let peggedUSD, peggedEUR: Double?
}

enum CirculatingPrev: Codable {
    case circulatingPrevDay(CirculatingPrevDay)
    case number(Double)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let doubleValue = try? container.decode(Double.self) {
            self = .number(doubleValue)
        } else if let circulatingValue = try? container.decode(CirculatingPrevDay.self) {
            self = .circulatingPrevDay(circulatingValue)
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unable to decode values")
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .number(let doubleValue):
            try container.encode(doubleValue)
        case .circulatingPrevDay(let circulatingValue):
            try container.encode(circulatingValue)
        }
    }
}
enum CirculatingPrevMonthType<T: Codable>: Codable {
    case object(T)
    case number(Double)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let doubleValue = try? container.decode(Double.self) {
            self = .number(doubleValue)
        } else if let objectValue = try? container.decode(T.self) {
            self = .object(objectValue)
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unable to decode values")
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .number(let doubleValue):
            try container.encode(doubleValue)
        case .object(let objectValue):
            try container.encode(objectValue)
        }
    }
}

struct LoopringCirculatingPrevDay: Codable {
    let peggedUSD, peggedVAR: Double?
}

struct StellarCirculatingPrevDay: Codable {
    let peggedUSD, peggedJPY: Int?
}

enum PegMechanism: String, Codable {
    case algorithmic
    case cryptoBacked = "crypto-backed"
    case fiatBacked = "fiat-backed"
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
