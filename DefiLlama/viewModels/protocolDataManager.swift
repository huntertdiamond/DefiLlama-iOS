//
//  FetchProtocolData.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import Foundation

final class ProtocolDataManager {
    static let shared = ProtocolDataManager()
    
    private init() {}
    
    func fetchMainProtocolEndpoint() async throws -> [MainProtocolElement] {
        print("fetchMainProtocolEndpoint function called")

        let urlString = "https://api.llama.fi/protocols"
        guard let url = URL(string: urlString) else {
            print("Error forming URL from string: \(urlString)")
            throw URLError(.badURL)
        }
        
        do {
            print("Starting URL session...")
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Response is not a HTTPURLResponse")
                throw URLError(.badServerResponse)
            }

            guard httpResponse.statusCode == 200 else {
                print("HTTP Status Code: \(httpResponse.statusCode)")
                throw URLError(.badServerResponse)
            }

            print("HTTP response received, status code: \(httpResponse.statusCode), attempting to decode data...")
            
            do {
                let protocolElements = try JSONDecoder().decode([MainProtocolElement].self, from: data)
                print("Successfully decoded protocol elements: \(protocolElements.count) items received")
                
                if let firstElement = protocolElements.first {
                    print(firstElement)
                } else {
                    print("The protocols array is empty.")
                }
                
                return Array(protocolElements.prefix(100))
            } catch {
                print("Decoding error: \(error)")
                throw error
            }
        } catch {
            print("An error occurred during the URL session: \(error)")
            throw error
        }
    }



}
