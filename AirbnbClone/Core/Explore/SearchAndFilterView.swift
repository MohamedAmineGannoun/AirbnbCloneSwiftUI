//
//  SearchAndFilterView.swift
//  AirbnbClone
//
//  Created by Amine Gannoun on 17/05/2024.
//

import SwiftUI

struct SearchAndFilterView: View {
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            
            VStack(alignment: .leading , spacing:2){
                Text("Where to ?")
                    .fontWeight(.semibold)
                Text("Anywhere - Any week - Add guests")
                    .foregroundStyle(.gray)
            }
            .font(.footnote)
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            })
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay{
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: .black.opacity(0.4), radius: 2)
        }
        .padding()
    }
}

#Preview {
    SearchAndFilterView()
}
