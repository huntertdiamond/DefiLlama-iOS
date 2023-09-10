import Foundation
import SwiftUI

struct PrimarySheetContent: View {
    @State var searchText: String = ""
    @State var selectedCategory: Categories = .protocolRankings

    var body: some View {
        VStack(spacing: 4) {
            MainSheetHeader(selectedCategory: selectedCategory)
            SearchBar(text: $searchText)
            MainProtocolList()
        }
    }
}

struct SmallSheetDisplay_Preview: PreviewProvider {
    static var previews: some View {
        PrimarySheetContent()
    }
}

