//
//  imageView.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/9/23.
//

import SwiftUI


struct URLImageView: View {
    let url: String
    
    @State private var imageData: Data?
    
    func fetchImage() {
        guard let url = URL(string: url) else { return }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                imageData = data
            } catch {
                print("Failed to load image: \(error)")
                // Handle error appropriately in your app
            }
        }
    }
    
    var body: some View {
        if let data = imageData, let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
        } else {
            Circle()
                .fill(Color.ourGreenLight)
                .onAppear {
                    fetchImage()
                }
        }
    }
    

}
