//
//  chartPreLoader.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/12/23.
//

import Foundation
import SwiftUI


struct ChartPreloader: View {
    var body: some View {
        VStack{
            Rectangle()
                .foregroundColor(Color.ourBlueLight)
                .chartAnimation((.init(tint: .ourBlue, highlight: Color.ourBlue, blur: 100)))
                .frame(height: 300)
        }
        .cornerRadius(12)
    }
}

struct ChartPreloader_Preview: PreviewProvider {
    static var previews: some View {
        ChartPreloader()
    }
}
