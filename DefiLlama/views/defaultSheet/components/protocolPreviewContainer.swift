//
//  protocolPreviewContainer.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import Foundation
import SwiftUI

struct ProtocolPreviewContainer: View {
    let displayedProtocol: MainProtocolElement
    @State var showProtocolSheet: Bool = false

    var body: some View{
        VStack(alignment: .leading){
            HStack{
                HStack{
                    URLImageView(url: displayedProtocol.logo)
                        .frame(width: 30, height: 30)
                        .cornerRadius(40)
                    VStack(alignment: .leading){
                        Text(displayedProtocol.name)
                            .font(.title3)
                            .fontWeight(.medium)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                        if displayedProtocol.symbol != "-"{
                            Text(displayedProtocol.symbol)
                                .font(.caption2)
                                .foregroundColor(Color.textSecondary)
                        }
                    }
                    Spacer()
                }
                .frame(width: 150)
                Spacer()
                VStack(alignment: .leading){
                    Text(FormatNumbers.shared.abbreviateDoubles(for: displayedProtocol.tvl))
                        .font(.body)
                        .fontWeight(.medium)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)

                    Text("TVL")
                        .font(.caption2)
                        .foregroundColor(Color.textSecondary)
                }
                Spacer()
                VStack(alignment: .leading){
                    
                    Text( FormatNumbers.shared.addPercentageSign(for: displayedProtocol.change1D  ?? 0.0))
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(displayedProtocol.change1D ?? 0.0 >= 0 ? Color.ourGreen : Color.ourRed)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    Text("24h")
                        .font(.caption2)
                        .foregroundColor(Color.textSecondary)
                }
                Spacer()
                VStack(alignment: .leading){
                    Text(FormatNumbers.shared.addPercentageSign(for: displayedProtocol.change7D  ?? 0.0))
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(displayedProtocol.change7D ?? 0.0 >= 0 ? Color.ourGreen : Color.ourRed)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    Text("1w")
                        .font(.caption2)
                        .foregroundColor(Color.textSecondary)
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity) // Takes up as much space as available.
        .padding(12)
        .background(Color.l1)
        .cornerRadius(8)
        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.borderLight, lineWidth: 1))
        .onTapGesture {
            showProtocolSheet.toggle()
        }
        .sheet(isPresented: $showProtocolSheet){
            ProtocolSheetIndex(passedProtocol: displayedProtocol)
        }
    }
}



