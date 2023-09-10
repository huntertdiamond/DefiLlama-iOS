//
//  ProtocolTVLChart.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/10/23.
//

import Foundation
import SwiftUI
import Charts


struct ProtocolTVLChart: View{
    @State var tvlData: [TVLData] = []
    func formatLabel(price: Double) -> String {
        let billion = Int(price / 1_000_000_000)
        let million = Int((price.truncatingRemainder(dividingBy: 1_000_000_000)) / 1_000_000)
        if billion > 0 {
            return "\(billion)B"
        } else if million > 0 {
            return "\(million)M"
        } else {
            return "\(Int(price))"
        }
    }
    let passedProtocol: MainProtocolElement
    let receivedProtocolElement: SingleProtocol
    var body: some View{
        
        
        VStack(alignment: .leading, spacing: 12){
            ProtocolChartContainerHeader(passedProtocol: passedProtocol)
            VStack{
                Chart(tvlData) { data in
                    LineMark(
                        x: .value("Date", Date(timeIntervalSince1970: data.date)),
                        y: .value("TVL", data.tvl)
                    )
                }.chartYAxis {
                    AxisMarks(position: .leading, values: .automatic(desiredCount: 6)) { value in
                        AxisGridLine()
                        AxisTick()
                        
                        AxisValueLabel {
                            if let doubleValue = value.as(Double.self) {
                                Text("\(formatLabel(price: doubleValue))")
                            }
                        }
                    }
                }
            }
            .frame(height: 350)

        }
        .padding(12)
        .background(Color.l1)
        .cornerRadius(8)
    }
}


struct ProtocolChartContainerHeader: View {
    let passedProtocol: MainProtocolElement

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
                Image(systemName: "calendar")
                    .fontWeight(.bold)
                    .padding(8)
                    .background(Color.ourBlueLight)
                    .clipShape(Circle())
                Image(systemName: "pencil")
                    .fontWeight(.bold)

                    .padding(8)
                    .background(Color.ourBlueLight)
                    .clipShape(Circle())
            }
            .font(.subheadline)
            .fontWeight(.bold)
            .foregroundColor(Color.ourBlue)
        }
    }
}
