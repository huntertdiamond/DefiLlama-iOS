//
//  protocolChartContainerHeader.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/10/23.
//

import SwiftUI

struct ProtocolChartContainerHeader: View {
    let passedProtocol: MainProtocolElement
    
    @State private var selectedDate = Date()
    @State private var showingDatePicker = false
    @Binding var displayedChart: ProtocolChartsDisplay
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 0){
                Text("\(FormatNumbers.shared.abbreviateDoubles(for: passedProtocol.tvl))")
                    .font(.title3)
                    .fontWeight(.bold)
                Text("Total Value Locked")
                    .foregroundColor(Color.textSecondary)
                    .font(.subheadline)
            }
            Spacer()
            HStack{
                
                
                Menu {
                    Button("TVL", action: { displayedChart = .tvl })
                    Button("TVL by chain", action: { displayedChart = .tvlByChain })
                    Button("Tokens (USD)", action: { displayedChart = .tokens})
                } label: {
                    Image(systemName: "ellipsis")
                        .fontWeight(.bold)
                        .frame(width: 30, height: 30)
                        .background(Color.ourBlueLight)
                        .clipShape(Circle())
                }
            }
            .font(.subheadline)
            .fontWeight(.bold)
            .foregroundColor(Color.ourBlue)
        }
    }
}

enum ProtocolChartsDisplay: String {
    case tvl = "TVL"
    case tvlByChain = "TVL by Chain"
    case tokens = "Tokens (USD)"
}
