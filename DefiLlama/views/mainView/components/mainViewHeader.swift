//
//  mainViewHeader.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import Foundation
import SwiftUI


struct MainViewHeader: View {
    @EnvironmentObject var selectedCategory: SelectedCategory
    @EnvironmentObject var selectedChain: SelectedChain
    var displayedTVL: Double
    var body: some View{
        VStack(alignment:.leading, spacing: 8){
            VStack(alignment:.leading, spacing: 2){
                Text("$\(FormatNumbers.shared.abbreviateDoubles(for: displayedTVL))")
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
                    Text("$\(FormatNumbers.shared.abbreviateDoubles(for: 124351000000))")
                        .fontWeight(.bold)
                }
                HStack{
                    Text("Volume (24h):")
                        .font(.callout)
                        .foregroundColor(Color.textSecondary)
                    
                    Spacer()
                    
                    Text("$880.98M")
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
        MainViewHeader(displayedTVL: 2)
            .environmentObject(SelectedChain())
    }
}



struct MainViewInfoBoxController: View {
    @EnvironmentObject var selectedChain: SelectedChain

    var body: some View{
        VStack{
            
        }
    }
}
