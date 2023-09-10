//
//  protocolSheetIndex.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import SwiftUI

struct ProtocolSheetIndex: View {
    
    @State var passedProtocol: MainProtocolElement
    @State var receivedProtocolElement: SingleProtocol = SingleProtocol()
    
    @State var isLoading: Bool = true
    
    func convertToTVLData(tvlArray: [Tvl]?) -> [TVLData] {
        guard let tvlArray = tvlArray else { return [] }
        
        return tvlArray.compactMap { tvl in
            if let date = tvl.date, let totalLiquidityUSD = tvl.totalLiquidityUSD {
                return TVLData(date: Double(date), tvl: totalLiquidityUSD)
            }
            return nil
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if isLoading {
                ProtocolSheetLoader()
            }else {
                ProtocolHeader(passedProtocol: passedProtocol)
                if let tvlData = receivedProtocolElement.tvl, !tvlData.isEmpty {
                    
                    ProtocolTVLChart(tvlData: convertToTVLData(tvlArray: tvlData), passedProtocol: passedProtocol, receivedProtocolElement: receivedProtocolElement)
                    
                }
                ProtocolInfoBox(passedProtocol: passedProtocol, receivedProtocolElement: receivedProtocolElement)
            }
            Spacer()
        }
        .padding()
        .task {
            do {
                self.receivedProtocolElement = try await ProtocolDataManager.shared.fetchSpecificProtocol(for: passedProtocol.slug)
                self.isLoading = false
            } catch {
                // Handle the error here, possibly with an alert or some user-friendly message
            }
        }
    }
}

struct protocolSheetIndex_Previews: PreviewProvider {
    static var previews: some View {
        ProtocolSheetIndex(passedProtocol: MainProtocolElement(
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
            slug: "lido",
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

struct ProtocolHeader: View {
    let passedProtocol: MainProtocolElement
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            HStack(alignment: .center){
                HStack{
                    URLImageView(url: passedProtocol.logo)
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                    Text(passedProtocol.name)
                        .font(.title)
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

struct ProtocolInfoBox: View {
    let passedProtocol: MainProtocolElement
    let receivedProtocolElement: SingleProtocol

    var body: some View{
        VStack(spacing: 8){
            ProtocolBoxRow(title: "Category", displayedValue: "\(passedProtocol.category.rawValue)")
            ProtocolBoxRow(title: "Market Cap", displayedValue: "$1.13B")
            ProtocolBoxRow(title: "LDO Price", displayedValue: "$1.63")
            ProtocolBoxRow(title: "LDO FDV", displayedValue: "$1.63B")
            ProtocolChainIconDisplay(passedChains: [.solana, .arbitrum, .ethereum, .avalanche])
        }
        .padding()
        .background(Color.l1)
        .cornerRadius(8)
    }
}

struct ProtocolBoxRow: View {
    let title: String
    let displayedValue: String
    var body: some View {
        HStack(alignment: .firstTextBaseline){
            Text(title)
                .font(.subheadline)
                .foregroundColor(Color.textSecondary)
            Spacer()
            Text(displayedValue)
                .font(.title3)
                .fontWeight(.medium)
        }
    }
}

struct ProtocolChainIconDisplay: View {
    @State var passedChains: [BigTenChains]
    var body: some View{
        HStack{
            Text("Chains")
                .font(.subheadline)
                .foregroundColor(Color.textSecondary)

            Spacer()
            HStack(spacing: -1){
                ForEach(passedChains, id: \.self) { chain in
                    Image(chain.rawValue.lowercased())
                        .resizable()
                        .frame(width: 20, height: 20)
                        .clipShape(Circle())
                }
            }
        }
    }
}

struct TVLChartHeader: View {
    let passedProtocol: MainProtocolElement
    var body: some View{
        HStack{
            VStack(alignment: .leading,spacing: 0){
                Text("$\(FormatNumbers.shared.abbreviateDoubles(for: passedProtocol.tvl))")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Total Value Locked")
                    .font(.callout)
                    .foregroundColor(Color.textSecondary)
            }
            Spacer()
            HStack{
                Image(systemName: "calendar")
                    .padding(8)
                    .background(Color.ourBlueLight)
                    .clipShape(Circle())
                    .foregroundColor(Color.ourBlue)
                Image(systemName: "pencil")
                    .padding(8)
                    .background(Color.ourBlueLight)
                    .clipShape(Circle())
                    .foregroundColor(Color.ourBlue)
            }
            .font(.subheadline)
            .fontWeight(.semibold)
        }            .padding(.horizontal, 8)

    }
}

struct ProtocolSheetLoader: View {
    var body: some View{
        VStack{
            Rectangle()
                .fill(.ultraThinMaterial)
                .frame(height: 35)
                .cornerRadius(8)
            Rectangle()
                .fill(.ultraThinMaterial)
                .frame(height: 400)
                .cornerRadius(8)
            Rectangle()
                .fill(.ultraThinMaterial)
                .frame(height: 250)
                .cornerRadius(8)
        }
    }
}


