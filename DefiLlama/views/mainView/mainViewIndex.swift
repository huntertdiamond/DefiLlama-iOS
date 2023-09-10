//
//  mainViewIndex.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import SwiftUI

struct MainViewIndex: View {
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading, spacing: 8){
                MainViewHeader()
                TVLChart()
                
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



