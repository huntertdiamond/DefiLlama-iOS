//
//  mainProtocolList.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import SwiftUI

struct MainProtocolList: View {
    
    @State private var returnedProtocols: [MainProtocolElement] = []
    @State var isLoading: Bool = true

    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(spacing: 4) {
                if isLoading {
                    Text("Loading...")
                } else {
                    ForEach(returnedProtocols, id: \.id) { displayedProtocol in
                        ProtocolPreviewContainer(displayedProtocol: displayedProtocol)
                    }
                }
            }
        }
        .task {
            do {
                let fetchedProtocols = try await ProtocolDataManager.shared.fetchMainProtocolEndpoint()
                DispatchQueue.main.async {
                    self.returnedProtocols = fetchedProtocols
                    self.isLoading = false
                }
            } catch {
                print("Error fetching protocols: \(error)")
            }
        }

    }
    

}


struct mainProtocolList_Previews: PreviewProvider {
    static var previews: some View {
        MainProtocolList()
    }
}
