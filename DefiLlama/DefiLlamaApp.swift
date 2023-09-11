//
//  DefiLlamaApp.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import SwiftUI

@main
struct DefiLlamaApp: App {
    @StateObject private var selectedCategory = SelectedCategory()
    @StateObject var selectedChain = SelectedChain()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(selectedCategory)
                .environmentObject(selectedChain)

        }
    }
}
