//
//  mainViewPreLoader.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/12/23.
//

import SwiftUI

struct MainViewPreLoader: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
   
                Rectangle()
                    .frame(width: 100, height: 40)
                    .cornerRadius(8)
                    .foregroundColor(Color.ourBlueLight)

                Rectangle()
                    .frame(width: 120, height: 20)
                    .cornerRadius(4)
                    .foregroundColor(Color.ourBlueLight)

  
            
            HStack{
                ForEach(0...3, id: \.self) { _ in
                    Rectangle()
                        .frame(width: 90, height: 30)
                        .cornerRadius(8)
                        .foregroundColor(Color.ourBlueLight)

                }
            }
            Rectangle()
                .frame( height: 200)
                .cornerRadius(12)
                .foregroundColor(Color.ourBlueLight)
            ChartPreloader()
            Spacer()
        }.padding()
    }
}

struct mainViewPreLoader_Previews: PreviewProvider {
    static var previews: some View {
        MainViewPreLoader()
    }
}
