//
//  ProfileView.swift
//  AirbnbClone
//
//  Created by Amine Gannoun on 21/05/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                VStack(alignment: .leading, spacing: 32){
                    
                    Text("Log in to start planning your next trip")
                    
                    
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

                    HStack{
                        Text("Don't have an account?")
                        
                        Text("Sign up")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    
                }
                
                VStack(alignment: .leading, spacing: 12){
                    ProfileRowView(imageName: "gear", description: "Settings")
                    ProfileRowView(imageName: "gear", description: "Accessiblity")
                    ProfileRowView(imageName: "questionmark.circle", description: "Visit the help center")
                }
                
                Spacer()
            }
            .navigationTitle("Profile")
            .padding()
        }

    }
}

#Preview {
    ProfileView()
}
