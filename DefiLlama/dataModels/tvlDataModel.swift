//
//  tvlDataModel.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import Foundation
struct TVLData: Codable, Identifiable {
    let date: Double
    let tvl: Double
    var id: Double { date } // Use date as unique id
}
