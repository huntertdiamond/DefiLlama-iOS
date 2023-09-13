//
//  preloaderWithShimmer.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/12/23.
//

import Foundation
import SwiftUI


struct SheetPreloader: View {
    var body: some View{
        VStack{
            ForEach(1...8, id: \.self){_ in
                Rectangle()
                    .foregroundColor(Color.ourBlue)
                    .frame(height: 90)
                    .shimmer(.init(tint: .ourBlue.opacity(0.1), highlight: Color.ourBlueLight, blur: 12))
                    .cornerRadius(12)
            }
        }
    }
}

struct SheetPreloader_Preview: PreviewProvider {
    static var previews: some View {
        SheetPreloader()
    }
}
