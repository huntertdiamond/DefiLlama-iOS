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

    var body: some View{
        
        
        VStack(alignment: .leading, spacing: 12){
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
