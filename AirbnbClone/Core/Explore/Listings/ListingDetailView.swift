//
//  ListingDetailView.swift
//  AirbnbClone
//
//  Created by Amine Gannoun on 20/05/2024.
//

import SwiftUI

import MapKit

struct ListingDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                
                ListingImagesCarousselView()
                
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background{
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(40)
                })
                
            }
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading, spacing: 4){
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                        Text("4.86")
                        Text(" - ")
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    
                    Text("Miami, Florida")
                    
                }
                .font(.caption)

                
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            
            Divider()
                .padding(.leading)
            
            // Host info view
            HStack(spacing: 4) {
                VStack (alignment: .leading){
                    Text("Entire villa hosted by John Smith")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    HStack(spacing: 4){
                        Text("4 guests -")
                        Text("4 bedrooms -")
                        Text("4 beds -")
                        Text("3 baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                Image("female-1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                
            }
            .padding([.leading, .trailing])
            
            Divider()
                .padding(.leading)
            
            // Features
            VStack(alignment: .leading, spacing: 16) {
                ForEach(0 ..< 2) { feature in
                    HStack(spacing: 12) {
                        Image(systemName: "medal")
                        VStack(alignment: .leading){
                            Text("Self check-in")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text("Check yourself in with the keypad")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            Divider()
                .padding()
            
            // Bedrooms view
            VStack(alignment: .leading, spacing: 16){
                Text("Where you'll sleep")
                    .font(.headline)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(1..<5) { bedroom in
                            VStack(alignment: .leading , spacing: 4){
                                Image(systemName: "bed.double")
                                Text("bedroom \(bedroom)")
                            }
                            .frame(width: 132, height: 100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1.0)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
                
            }
            .padding()
            
            Divider()
                .padding(.leading)
            
            // Offers
            VStack(alignment: .leading, spacing: 16) {
                Text("What this place offers")
                    .font(.headline)
                ForEach(0..<4){ offer in
                    HStack(spacing: 8){
                        Image(systemName: "wifi")
                            .frame(width: 32)
                        Text("Wifi")
                            .font(.footnote)
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
                .padding(.leading)
            
            // MAP
            VStack(alignment: .leading, spacing: 16){
                Text("Where you'll be")
                    .font(.headline)
                
                Map()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
            }
            .padding()
            
        }
        .padding(.bottom, 100)
        .ignoresSafeArea(edges: [.top])
        .overlay(alignment: .bottom, content: {
            VStack(alignment: .leading){
                Divider()
                    .padding(.bottom)
                
                HStack{
                    
                    VStack(alignment: .leading){
                        Text("$ 500")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                            .font(.footnote)
                        
                        Text("Oct 15 - 20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    
                }.padding(.horizontal, 32)
                
            }
            .background(.white)
        })
    }
}

#Preview {
    ListingDetailView()
}
