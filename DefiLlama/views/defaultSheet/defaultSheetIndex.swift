//
//  defaultSheetIndex.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import SwiftUI

struct DefaultSheetIndex: View {
    @Binding var selectedDetent: PresentationDetent
    var placeholder: String = ""
    
    @State private var text: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            SmallSheetDisplay()
            
        }
        .preferredColorScheme(.light)
        .padding()
    }
}

struct DefaultSheetIndex_Previews: PreviewProvider {
    static var searchText: String = ""
    
    static var previews: some View {
        DefaultSheetIndex(selectedDetent: .constant(.fraction(0.25)))
    }
}



