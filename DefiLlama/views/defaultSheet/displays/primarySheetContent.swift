import Foundation
import SwiftUI

struct ProtocolSheetDisplay: View {
    @State var searchText: String = ""
    @EnvironmentObject var selectedCategory: SelectedCategory

    var body: some View {
        VStack(spacing: 4) {
            MainProtocolList()
        }
    }
}

struct SmallSheetDisplay_Preview: PreviewProvider {
    static var previews: some View {
        ProtocolSheetDisplay()
    }
}

