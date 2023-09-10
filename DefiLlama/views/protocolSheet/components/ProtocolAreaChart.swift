//
//  ProtocolAreaChart.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/10/23.
//

import SwiftUI
import Charts

struct ProtocolAreaChart: View {
    @State var passedProtocol: MainProtocolElement
    @State var receivedProtocolElement: SingleProtocol = SingleProtocol()
    
    @State var isLoading: Bool = true
    @State var dataToChart: [TVLByChain] = []
    func mapToTVLByChain(chainTvls: [String: ChainTvl]?) -> [TVLByChain] {
        guard let chainTvls = chainTvls else { return [] }
        
        return chainTvls.map { chainName, chainTvl in
            let tvlArray = chainTvl.tvl ?? []
            
            let chartingData = tvlArray.compactMap { tvl -> TVLData? in
                guard
                    let date = tvl.date,
                    let totalLiquidityUSD = tvl.totalLiquidityUSD
                else {
                    return nil
                }
                
                return TVLData(date: Double(date), tvl: totalLiquidityUSD)
            }
            
            return TVLByChain(chain: chainName, chartingData: chartingData)
        }
    }
    
    
    var body: some View {
        VStack{
            if isLoading {
                ProgressView()
            } else {
                VStack{
                    Chart {
                        ForEach(dataToChart, id: \.chain) { chainData in
                            ForEach(chainData.chartingData, id: \.date) { data in
                                AreaMark(
                                    x: .value("Date", Date(timeIntervalSince1970: data.date)),
                                    y: .value(chainData.chain, data.tvl)
                                    
                                )
                                .foregroundStyle(by: .value("Chain", chainData.chain))
                            }
                        }
                    }
                    .chartYAxis {
                        AxisMarks(position: .leading, values: .automatic(desiredCount: 4)) { value in
                            AxisGridLine()
                            AxisTick()
                            
                            AxisValueLabel {
                                if let doubleValue = value.as(Double.self) {
                                    Text("\(FormatNumbers.shared.abbreviateDoubles(for: doubleValue))")
                                }
                            }
                        }
                    }
                }
                
                .frame(height: 350)
            }
        }
        .task {
            do {
       
                self.dataToChart = mapToTVLByChain(chainTvls: receivedProtocolElement.chainTvls)
                self.isLoading = false
            } catch {
                // Handle the error here, possibly with an alert or some user-friendly message
            }
        }
    }
}
struct ProtocolAreaChart_Previews: PreviewProvider {
    static var previews: some View {
        ProtocolAreaChart(passedProtocol: MainProtocolElement(
            id: "182",
            name: "Lido",
            address: "0x5a98fcbea516cf06857215779fd812ca3bef1b32",
            symbol: "LDO",
            url: "https://lido.fi/",
            description: "Liquidity for staked assets. Daily rewards, no lock ups. Available for Ethereum, Solana, Polygon, Terra, Kusama & Polkadot.",
            chain: "Multi-Chain",
            logo: "https://icons.llama.fi/lido.png",
            audits: "2",
            auditNote: nil,
            geckoID: "lido-dao",
            cmcID: "8000",
            category: .liquidStaking, // Assuming `ProtocolCategory` has a case named `liquidStaking`
            chains: ["Ethereum", "Solana", "Moonbeam", "Moonriver", "Terra"],
            module: "lido/index.js",
            twitter: "LidoFinance",
            forkedFrom: nil, // This field wasn't provided in your data
            oracles: nil, // This field wasn't provided in your data
            listedAt: nil, // This field wasn't provided in your data
            slug: "binance",
            tvl: 14096136354.6758,
            chainTvls: [
                "Ethereum": 14049389624.225142,
                "Moonriver": 250469.06206581692,
                "Solana": 45215866.238341354,
                "Terra": 0,
                "Moonbeam": 1280395.150251406
            ],
            change1H: 0.009193921867407084,
            change1D: -0.29864546024234073,
            change7D: -0.06606913084405619,
            tokenBreakdowns: TokenBreakdowns(), // Assuming `TokenBreakdowns` is correctly defined
            mcap: 1297613373.4508486,
            referralURL: "https://stake.lido.fi/?ref=0x08a3c2A819E3de7ACa384c798269B3Ce1CD0e437",
            treasury: "lido.js",
            auditLinks: ["https://github.com/lidofinance/audits"],
            openSource: true,
            governanceID: ["snapshot:lido-snapshot.eth"],
            github: ["lidofinance"],
            stablecoins: nil, // This field wasn't provided in your data
            parentProtocol: nil, // This field wasn't provided in your data
            wrongLiquidity: nil, // This field wasn't provided in your data
            staking: nil, // This field wasn't provided in your data
            pool2: nil, // This field wasn't provided in your data
            assetToken: nil, // This field wasn't provided in your data
            language: nil, // This field wasn't provided in your data
            oraclesByChain: nil, // This field wasn't provided in your data
            deadURL: nil, // This field wasn't provided in your data
            rugged: nil // This field wasn't provided in your data
        ))
    }
}



struct TVLByChain: Codable {
    let chain: String
    let chartingData: [TVLData]
}

