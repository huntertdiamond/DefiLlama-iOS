//
//  MediumSheetDisplay.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import Foundation
import SwiftUI

struct MediumSheetDisplay: View {
    var body: some View{
        VStack(spacing: 2){
            HStack{
                HStack{
                    Text("Protocol Rankings")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Image(systemName: "chevron.down")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
                Spacer()
                Image(systemName: "gearshape")
                    .frame(width: 40, height: 40)
                
                    .fontWeight(.bold)
            }
            VStack{
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .frame(height: 250)
            }
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.borderLight, lineWidth: 2))
        }
        .padding(.vertical)
    }
}
