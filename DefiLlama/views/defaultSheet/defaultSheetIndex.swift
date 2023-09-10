//
//  defaultSheetIndex.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import SwiftUI

struct PrimarySheetIndex: View {
    @Binding var selectedDetent: PresentationDetent
    var placeholder: String = ""
    
    @State private var text: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            PrimarySheetContent()
            
        }
        .padding()
   
    }
}

struct DefaultSheetIndex_Previews: PreviewProvider {
    static var searchText: String = ""
    
    static var previews: some View {
        PrimarySheetIndex(selectedDetent: .constant(.fraction(0.25)))
    }
}



