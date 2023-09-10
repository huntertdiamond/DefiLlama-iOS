//
//  ContentView.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var presentDefaultSheet: Bool = true
    @State var selectedDetent: PresentationDetent = .fraction(0.25)
    private let availableDetents: Set<PresentationDetent> = [.fraction(0.25), .fraction(0.6), .fraction(1)]

    var body: some View {
        VStack {
            MainViewIndex()
        }
        .padding(.horizontal, 12)
        .sheet(isPresented: $presentDefaultSheet) {
            PrimarySheetIndex(selectedDetent: $selectedDetent)
                .presentationDetents(availableDetents, selection: $selectedDetent)
                .presentationBackgroundInteraction(
                    .enabled(upThrough: .fraction(1))
                )
                .interactiveDismissDisabled(true)
                .onChange(of: selectedDetent) { newValue in
                    let generator = UIImpactFeedbackGenerator(style: .medium)
                    generator.impactOccurred()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
