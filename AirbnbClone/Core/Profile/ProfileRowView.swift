//
//  ProfileRowView.swift
//  AirbnbClone
//
//  Created by Amine Gannoun on 21/05/2024.
//

import SwiftUI

struct ProfileRowView: View {
    
    var imageName : String
    var description : String
    
    var body: some View {
        VStack {
            HStack{
                Image(systemName: imageName)
                Text(description)
                    .font(.subheadline)
                Spacer()
                Image(systemName: "chevron.right")
            }
            Divider()
                .padding(.leading)
        }
    }
}

#Preview {
    ProfileRowView(imageName: "gear", description: "Settings")
}
