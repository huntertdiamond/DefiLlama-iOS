//
//  yieldDataManager.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/10/23.
//

import Foundation


final class YieldDataManager {
    static let shared = YieldDataManager()
    
    private init() {}
    
    // MARK: HELPER TO SIMPLIFY DATA MODEL
    
    func getProtocolYieldItems(from yieldOwner: YieldOwner) -> [ProtocolYieldItem] {
        return yieldOwner.data ?? []
    }
    func fetchAllYieldData() async throws -> [ProtocolYieldItem] {
        print("called for yields")
        let urlString = "https://yields.llama.fi/pools"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw URLError(.badServerResponse)
            }
            
            guard httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }

            do {
                let yieldOwner = try JSONDecoder().decode(YieldOwner.self, from: data)
                
                let yieldElements = getProtocolYieldItems(from: yieldOwner)
                
                return Array(yieldElements.prefix(200))
                
            } catch {
                print("Decoding error: \(error)")
                throw error
                
            }
        } catch {
            throw error
        }
    }

}

