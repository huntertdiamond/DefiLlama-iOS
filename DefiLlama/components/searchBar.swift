//
//  searchBar.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import Foundation
import SwiftUI


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
