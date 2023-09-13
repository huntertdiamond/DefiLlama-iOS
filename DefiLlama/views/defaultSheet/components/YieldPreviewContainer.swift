//
//  YieldPreviewContainer.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/10/23.
//

import Foundation
import SwiftUI

struct YieldPreviewContainer: View {
    let passedYield: ProtocolYieldItem

    var body: some View{
        HStack(){
            HStack{
                VStack(alignment: .leading){
                    Text(passedYield.symbol ?? "Error")
                        .font(.title3)
                        .fontWeight(.medium)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                    Text(passedYield.project ?? "Error")
                        .font(.caption)
                        .foregroundColor(Color.textSecondary)
                }
                Spacer()
            }
            .frame(width: 130)
            
            Spacer()
            StablecoinPreviewItem(valueDisplayed: "$\(FormatNumbers.shared.abbreviateInt(for: passedYield.tvlUsd ?? 0))", caption: "TVL")
            Spacer()
            StablecoinPreviewItem(valueDisplayed: "\(FormatNumbers.shared.addPercentageSign(for: passedYield.apyBase ?? 0))", caption: "Base APY")
            Spacer()
            StablecoinPreviewItem(valueDisplayed: "\(FormatNumbers.shared.addPercentageSign(for: passedYield.apyReward ?? 0))", caption: "Reward APY")

        }
        .padding(12)
        .background(Color.sheetL1)
        .cornerRadius(8)
    }
}
