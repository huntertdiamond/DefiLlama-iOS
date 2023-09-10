//
//  MainSheetHeader.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/10/23.
//

import Foundation
import SwiftUI

struct MainSheetHeader: View {
    
    var body: some View{
        HStack {
            MainSheetDisplaySelector()
            Spacer()
            
            Button(action:{} ){
                Image(systemName: "gearshape")
                    .fontWeight(.bold)
                    .font(.title3)
            }
        }
    }
}

