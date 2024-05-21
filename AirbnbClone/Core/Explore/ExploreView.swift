//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Amine Gannoun on 17/05/2024.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var showSearchDestinationView = false
    
    var body: some View {
        NavigationStack{
            
            if showSearchDestinationView {
                SearchDestinationView(show: $showSearchDestinationView)
            }else{
                
                VStack {
                    SearchAndFilterView()
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showSearchDestinationView.toggle()
                            }
                        }
                    
                    ScrollView{
                        LazyVStack(spacing: 32){
                            ForEach( 0 ... 10, id: \.self ) { listing in
                                NavigationLink(value: listing, label: {
                                    ListingItemView()
                                        .frame(height: 400)
                                })
                            }
                        }
                        .padding()
                    }
                }
                .navigationDestination(for: Int.self, destination: { listing in
                    ListingDetailView()
                        .navigationBarBackButtonHidden()
                })
                
            }
        }
    }
}

#Preview {
    ExploreView()
}
