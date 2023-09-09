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
                TextField(placeholder, text: $text)
                    .frame(height: 50)
            }
            .background(Color.l1)
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.borderLight, lineWidth: 2))
            VStack{
                Spacer()
                SpacerStack()
                
            }
            .background(Color.l1)
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.borderLight, lineWidth: 2))
        }
        .padding()
    }
}

struct DefaultSheetIndex_Previews: PreviewProvider {
    static var searchText: String = ""
    
    static var previews: some View {
        DefaultSheetIndex(selectedDetent: .constant(.medium))
    }
}
