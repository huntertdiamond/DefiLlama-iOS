//
//  yieldSheetDisplay.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/10/23.
//

import SwiftUI

struct YieldSheetDisplay: View {
    @State var yieldItems: [ProtocolYieldItem] = []
    @State var isLoading: Bool = true
    var body: some View {
        VStack{
            if !isLoading {
                ForEach(yieldItems, id: \.pool) { yieldItem in
                    
                    YieldPreviewContainer(passedYield: yieldItem)
                }            } else {
             Text("loading")
            }
            
        }
        .task{
            do{
                self.yieldItems = try await YieldDataManager.shared.fetchAllYieldData()
                self.isLoading = false
            }
            catch{
                
            }
        }
    }
}


struct Yield_Preview: PreviewProvider {
    static var previews: some View {
        YieldSheetDisplay()
    }
}
