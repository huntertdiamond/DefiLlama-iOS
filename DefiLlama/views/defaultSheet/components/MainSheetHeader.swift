//
//  MainSheetHeader.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/10/23.
//

import Foundation
import SwiftUI

struct MainSheetHeader: View {
    @State var selectedCategory: Categories

    var body: some View{
        HStack {
            MainSheetDisplaySelector(selectedCategory: $selectedCategory)
            Spacer()

            Button(action:{} ){
                    Image(systemName: "gearshape")
                        .fontWeight(.bold)
                        .font(.title3)
                }
        }
    }
}

