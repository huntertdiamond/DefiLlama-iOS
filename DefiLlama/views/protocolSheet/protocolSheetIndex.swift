//
//  protocolSheetIndex.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import SwiftUI

struct ProtocolSheetIndex: View {
    @State var passedProtocol: MainProtocolElement
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            ProtocolHeader(passedProtocol: passedProtocol)
            ProtocolInfoBox(passedProtocol: passedProtocol)
            Spacer()
        }
        .padding()
        .preferredColorScheme(.light)

    }
}

//struct protocolSheetIndex_Previews: PreviewProvider {
//    static var previews: some View {
//        ProtocolSheetIndex()
//    }
//}

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
                Spacer()
                Image(systemName: "bell")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(8)
                    .background(Color.ourBlueLight)
                    .clipShape(Circle())
                    .foregroundColor(Color.ourBlue)
            }
        }
    }
}

struct ProtocolInfoBox: View {
    let passedProtocol: MainProtocolElement

    var body: some View{
        VStack(spacing: 8){
            ProtocolBoxRow(title: "Total Volume Locked", displayedValue: FormatNumbers.shared.abbreviateDoubles(for: passedProtocol.tvl))
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
