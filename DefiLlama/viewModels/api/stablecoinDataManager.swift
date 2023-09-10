//
//  stablecoinDataManager.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/10/23.
//

import Foundation

final class StablecoinDataManager {
    static let shared =  StablecoinDataManager()
    private init() {}
    
    func fetchStablecoinTVL() async throws -> StablecoinOwner {
//        print("fetchMainProtocolEndpoint function called")

        let urlString = "https://stablecoins.llama.fi/stablecoins?includePrices=true"
        guard let url = URL(string: urlString) else {
            print("Error forming URL from string: \(urlString)")
            throw URLError(.badURL)
        }
        
        do {
//            print("Starting URL session...")
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Response is not a HTTPURLResponse")
                throw URLError(.badServerResponse)
            }

            guard httpResponse.statusCode == 200 else {
                print("HTTP Status Code: \(httpResponse.statusCode)")
                throw URLError(.badServerResponse)
            }

//            print("HTTP response received, status code: \(httpResponse.statusCode), attempting to decode data...")
            
            do {
                let stablecoinTVLData = try JSONDecoder().decode(StablecoinOwner.self, from: data)
//                print("Successfully decoded protocol elements:")
 
                
                return stablecoinTVLData
            } catch {
                print("Decoding error: \(error)")
                throw error
            }
        } catch {
//            print("An error occurred during the URL session: \(error)")
            throw error
        }
    }
    
}
