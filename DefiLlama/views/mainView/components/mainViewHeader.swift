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

struct ChainTab: View {
    let title: String
    var isSelected: Bool
    
    var body: some View {
        HStack {
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(isSelected ? Color.ourBlue : Color.textPrimary)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(isSelected ? Color.ourBlueLight : Color.l1)
        .cornerRadius(8)
        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.borderLight, lineWidth: 1))
    }
}

struct ChainTabSelector: View {
    @State private var selectedTab: BigTenChains = .all // Assume you have 'all' enum case in your BigTenChains enum
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(BigTenChains.allCases, id: \.self) { chain in
                    ChainTab(title: chain.rawValue, isSelected: chain == selectedTab)
                        .onTapGesture {
                            selectedTab = chain
                        }
                }
            }
        }
    }
}
