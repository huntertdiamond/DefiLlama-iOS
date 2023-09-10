//
//  protocolChartIndex.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/10/23.
//

import SwiftUI

struct ProtocolChartIndex: View {
    @State var tvlData: [TVLData] = []

    @State var displayedChart: ProtocolChartsDisplay = .tvl
    let passedProtocol: MainProtocolElement
    let receivedProtocolElement: SingleProtocol
    var body: some View {
        VStack{
            ProtocolChartContainerHeader(passedProtocol: passedProtocol, displayedChart: $displayedChart)

            if displayedChart == .tvl {
                ProtocolTVLChart(tvlData: tvlData)
            }
            if displayedChart == .tvlByChain {
                ProtocolAreaChart(passedProtocol: passedProtocol, receivedProtocolElement: receivedProtocolElement)
            }
        }
        .padding(12)
        .background(Color.l1)
        .cornerRadius(8)
    }
}
