//
//  smallSheetDisplay.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import Foundation
import SwiftUI


struct SmallSheetDisplay: View {
    @State var searchText: String = ""

    var body: some View{
        VStack(spacing: 2){
            HStack{
                HStack{
                    Text("Protocol Rankings")
                        .font(.title2)
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
            SearchBar(text: $searchText)

            ProtocolPreviewContainer()
            
        }
    
    }
}

struct SmallSheetDisplay_Preview: PreviewProvider {
    static var previews: some View {
        SmallSheetDisplay()
    }
}



struct ProtocolPreviewContainer: View {
    
    var body: some View{
        VStack(alignment: .leading){
            HStack{
                HStack{
                    Circle()
                        .frame(width: 30, height: 30)
                    VStack(alignment: .leading){
                        Text("Lido")
                            .font(.title3)
                            .fontWeight(.medium)
                        
                        Text("$LDO")
                            .font(.caption2)
                            .foregroundColor(Color.textSecondary)
                    }
                }
                Spacer()
                VStack(alignment: .leading){
                    Text("3.32B")
                        .font(.body)
                        .fontWeight(.medium)
                    Text("TVL")
                        .font(.caption2)
                        .foregroundColor(Color.textSecondary)
                }
                Spacer()
                VStack(alignment: .leading){
                    Text("0.13%")
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(Color.ourGreen)
                    
                    Text("24h")
                        .font(.caption2)
                        .foregroundColor(Color.textSecondary)
                }
                Spacer()
                VStack(alignment: .leading){
                    Text("0.13%")
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(Color.ourGreen)
                    
                    Text("1m")
                        .font(.caption2)
                        .foregroundColor(Color.textSecondary)
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity) // Takes up as much space as available.
        .padding(12)
        .background(Color.l1)
        .cornerRadius(8)
        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.borderLight, lineWidth: 1))
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(14)
                .padding(.horizontal, 25)
                .background(Color.l1)
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.textSecondary)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if !text.isEmpty {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(Color.textSecondary)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.borderLight, lineWidth: 2))

                .disableAutocorrection(true)  // turns off autocorrection and spell check

        }
    }
}
