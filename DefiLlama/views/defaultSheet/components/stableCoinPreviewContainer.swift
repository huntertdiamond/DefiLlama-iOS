//
//  stableCoinPreviewContainer.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/10/23.
//

import SwiftUI

struct StableCoinPreviewContainer: View {
    let displayedStable: PeggedAsset
    
    var body: some View {
        HStack(){
            HStack{
                VStack(alignment: .leading){
                    Text(displayedStable.name ?? "Error")
                        .font(.title3)
                        .fontWeight(.medium)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                    Text("$\(displayedStable.symbol ?? "error")")
                        .font(.caption)
                        .foregroundColor(Color.textSecondary)
                }
                Spacer()
            }
            .frame(width: 150)
            
            Spacer()
            StablecoinPreviewItem(valueDisplayed: "$\(FormatNumbers.shared.abbreviateDoubles(for: displayedStable.circulating?.peggedUSD ?? 0))", caption: "In Circulation")
            Spacer()
            StablecoinPreviewItem(valueDisplayed: "$\(String(format: "%.2f", displayedStable.price ?? 0.00))", caption: "Price")
            Spacer()
            StablecoinPreviewItem(valueDisplayed: "\(displayedStable.noOfChains)", caption: "Chains")
            
        }
        .padding(12)
        .background(Color.l1)
        .cornerRadius(8)
    }
}



struct StablecoinPreviewItem: View {
    let valueDisplayed: String
    let caption: String
    var body: some View{
        VStack(alignment: .leading){
            Text(valueDisplayed)
                .font(.body)
                .fontWeight(.medium)
            
            Text(caption)
                .font(.caption2)
                .foregroundColor(Color.textSecondary)
        }
        
    }
}
