//
//  chainDataManager.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/10/23.
//

import SwiftUI

final class ChainDataManager {
    static let shared = ChainDataManager()
    private init()  {}
    
    func fetchTVLByChainSlug(for chain: String) async throws -> [TVLData] {
        let urlString = "https://api.llama.fi/v2/historicalChainTvl/\(chain)"
        print("called for \(chain)")
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
                let tvlData = try JSONDecoder().decode([TVLData].self, from: data)
                
 
                
                return tvlData
            } catch {
                throw error
            }
        } catch {
            throw error
        }
    }
        func fetchAllTVL() async throws -> [TVLData] {
        let urlString = "https://api.llama.fi/v2/historicalChainTvl"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
            print("called for all")

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw URLError(.badServerResponse)
            }

            guard httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }

            
            do {
                let tvlData = try JSONDecoder().decode([TVLData].self, from: data)
                
 
                
                return tvlData
            } catch {
                throw error
            }
        } catch {
            throw error
        }
    }
    
}
