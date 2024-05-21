//
//  WishListView.swift
//  AirbnbClone
//
//  Created by Amine Gannoun on 21/05/2024.
//

import SwiftUI

struct WishListView: View {
    var body: some View {
        
        NavigationStack{
            
            VStack(alignment: .leading, spacing: 32){
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Log in to view your wishlists.")
                        .font(.headline)
                    Text("You can create, view or edit wishlists once you've logged in.")
                        .font(.footnote)
                }
                
                Button {
                    
                } label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, maxHeight: 48)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))

                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlists")
            
        }
        
        
    }
}

#Preview {
    WishListView()
}
