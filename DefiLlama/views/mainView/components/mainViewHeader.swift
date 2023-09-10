//
//  mainViewHeader.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import Foundation
import SwiftUI


struct MainViewHeader: View {
    var body: some View{
        VStack(alignment:.leading, spacing: 8){
            VStack(alignment:.leading, spacing: 2){
                Text("$37.856B")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Total Value Locked")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(Color.textSecondary)
            }
            ChainTabSelector()
            VStack(alignment: .leading, spacing: 4){
                HStack{
                    Text("Stablecoins Market Cap:")
                        .font(.callout)
                        .foregroundColor(Color.textSecondary)
                    Spacer()
                    Text("$124.287 B")
                        .fontWeight(.bold)
                }
                HStack{
                    Text("Volume (24h):")
                        .font(.callout)

                        .foregroundColor(Color.textSecondary)
                    
                    Spacer()
                    
                    Text("$1.394B")
                        .fontWeight(.bold)
                }
                HStack{
                    Text("Total Funding:")
                        .foregroundColor(Color.textSecondary)
                        .font(.callout)

                    Spacer()
                    
                    Text("$96.347B")
                        .fontWeight(.bold)
                }
                
            }
            .padding()
            .background(Color.l1)
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.borderLight, lineWidth: 1))
        }
    }
}


struct VIEWPreview: PreviewProvider {
    static var previews: some View {
        MainViewHeader()
    }
}

