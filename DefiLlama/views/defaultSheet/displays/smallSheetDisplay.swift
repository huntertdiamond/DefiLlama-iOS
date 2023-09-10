import Foundation
import SwiftUI

struct SmallSheetDisplay: View {
    @State var searchText: String = ""
    @State var selectedCategory: Categories = .protocolRankings
    
    var body: some View {
        VStack(spacing: 2) {
            HStack {
                MainSheetDisplaySelector(selectedCategory: $selectedCategory)
                Spacer()
                Image(systemName: "gearshape")
                    .frame(width: 40, height: 40)
                    .fontWeight(.bold)
            }
            SearchBar(text: $searchText)
            MainProtocolList()
            
        }
    }
}

struct SmallSheetDisplay_Preview: PreviewProvider {
    static var previews: some View {
        SmallSheetDisplay()
    }
}

struct MainSheetDisplaySelector: View {
    @Binding var selectedCategory: Categories
    @State private var isMenuPresented: Bool = false

    var body: some View {
        VStack {
            Menu {
                ForEach(Categories.allCases, id: \.self) { category in
                    Button(action: {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        selectedCategory = category
                        isMenuPresented = false

                    }) {
                        Text(category.rawValue)
                    }
                }
            }
             label: {
                HStack {
                    Text(selectedCategory.rawValue)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Image(systemName: isMenuPresented ? "chevron.up" : "chevron.down")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
                .foregroundColor(Color.textPrimary)
                .onTapGesture {
                    isMenuPresented = true
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()

                }
            }
        }
    }
}


enum Categories: String, CaseIterable {
    case protocolRankings = "Protocol Rankings"
    case chainRanking = "Chains"
    case yields = "Yields"
    case coins = "Coins"
    case stablecoinData = "Stablecoins"
}
