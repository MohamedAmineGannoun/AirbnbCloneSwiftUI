//
//  ListingImagesCarousselView.swift
//  AirbnbClone
//
//  Created by Amine Gannoun on 20/05/2024.
//

import SwiftUI

struct ListingImagesCarousselView: View {
    
    var images = ["listing-1", "listing-2", "listing-3", "listing-4"]
    
    var body: some View {
        TabView {
            ForEach(images , id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .frame(height: 320)
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImagesCarousselView()
}
