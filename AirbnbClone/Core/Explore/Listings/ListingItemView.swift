//
//  ListingView.swift
//  AirbnbClone
//
//  Created by Amine Gannoun on 17/05/2024.
//

import SwiftUI

struct ListingItemView: View {
    
    var images = ["listing-3", "listing-2", "listing-1", "listing-4"]
    
    var body: some View {
        VStack(spacing: 8) {
            //image
            ListingImagesCarousselView(images: images)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            //details
            HStack(alignment: .top){
                
                VStack(alignment: .leading){
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    HStack(spacing:4){
                        Text("$324")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                }
                .foregroundStyle(.black)
                
                Spacer()
                
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    Text("4,86")
                }
                .foregroundStyle(.black)
                
            }
            .font(.footnote)
            
        }
    }
}

#Preview {
    ListingItemView()
}
