//
//  mainViewIndex.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import SwiftUI

struct MainViewIndex: View {
    let tvlData: [TVLData] = TVLChartViewModel.shared.loadTVLData()

    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading, spacing: 8){
                MainViewHeader()
                TVLChart(tvlData: tvlData)
                
                Spacer()
            }
        }
    }
}

struct mainViewIndex_Previews: PreviewProvider {
    static var previews: some View {
        MainViewIndex()
    }
}



