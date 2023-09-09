//
//  ContentView.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import SwiftUI

struct ContentView: View {
    @State var presentDefaultSheet: Bool = true
    @State var selectedDetent: PresentationDetent = .medium
    private let availableDetents: Set<PresentationDetent> = [.fraction(0.15), .fraction(0.6), .fraction(1)]

    var body: some View {
        VStack {
            MainViewIndex()
        }
        .padding(.horizontal, 12)
        .sheet(isPresented: $presentDefaultSheet) {
            DefaultSheetIndex(selectedDetent: $selectedDetent)
                .presentationDetents(availableDetents, selection: $selectedDetent)
           // allows the background content to be interacted with until the sheet is full size
                .presentationBackgroundInteraction(
                    .enabled(upThrough: .fraction(1))
                )
            // sheet cannot be dismissed
                .interactiveDismissDisabled(true)

        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
