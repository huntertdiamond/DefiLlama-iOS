//
//  tvlChartViewModel.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import Foundation
import SwiftUI


class TVLChartViewModel {
    
    static let shared  = TVLChartViewModel()
    
    private init() {}

    func loadTVLData() -> [TVLData] {
        guard let url = Bundle.main.url(forResource: "placeholderTVL", withExtension: "json") else {
            fatalError("Failed to locate placeholderTVL.json in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load placeholderTVL.json from bundle.")
        }
        
        let decoder = JSONDecoder()
        guard let tvlData = try? decoder.decode([TVLData].self, from: data) else {
            fatalError("Failed to decode placeholderTVL.json from bundle.")
        }
        
        return tvlData
    }
}

struct TVLData: Codable, Identifiable {
    let date: Double
    let tvl: Double
    var id: Double { date } // Use date as unique id
}
