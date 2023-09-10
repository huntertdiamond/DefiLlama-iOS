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



