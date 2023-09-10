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
        let urlString = "https://api.llama.fi/protocols"
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
                let protocolElements = try JSONDecoder().decode([MainProtocolElement].self, from: data)
                
 
                
                return Array(protocolElements.prefix(100))
            } catch {
                throw error
            }
        } catch {
            throw error
        }
    }
    
    func fetchSpecificProtocol(for protocolSlug: String) async throws -> SingleProtocol {
//        print("fetchMainProtocolEndpoint function called")

        let urlString = "https://api.llama.fi/protocol/\(protocolSlug)"
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
                let protocolElement = try JSONDecoder().decode(SingleProtocol.self, from: data)
//                print("Successfully decoded protocol elements:")
 
                
                return protocolElement
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
