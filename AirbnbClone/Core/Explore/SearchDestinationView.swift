//
//  SearchDestinationView.swift
//  AirbnbClone
//
//  Created by Amine Gannoun on 20/05/2024.
//

import SwiftUI


enum DestinationSearchOption {
    case location
    case dates
    case guests
}

struct SearchDestinationView: View {
    
    @Binding var show : Bool
    @State private var destination : String = ""
    
    @State private var selectedOption : DestinationSearchOption = .location
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Button(action: {
                withAnimation(.snappy){
                    show.toggle()
                }
            }, label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
                    .padding()
            })
            VStack {
                
                if selectedOption == .location {
                    
                    VStack(alignment: .leading) {
                        Text("Where to?")
                            .font(.title2)
                            .fontWeight(.semibold)
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .imageScale(.small)
                            TextField("Search destination", text: $destination)
                                .font(.subheadline)
                        }
                        .frame(height: 44)
                        .padding(.horizontal)
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1.0)
                                .foregroundStyle(Color(.systemGray4))
                        }
                    }
                    
                    
                }else{
                    CollapsedPickerView(title: "Where", description: "Add destination")
                    
                }
                
            }
            .padding()
            .frame(height: selectedOption == .location ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .location
                }
            }
            
            
            
            
            // Dates selection
            VStack {
                
                if selectedOption == .dates {
                    
                }else{
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
                
            }
            .padding()
            .frame(height: selectedOption == .dates ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .dates
                }
            }

            
            // Number Guests
            VStack {
                
                if selectedOption == .dates {
                    
                }else{
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .padding()
            .frame(height: selectedOption == .guests ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .guests
                }
            }
            
        }
    }
}

#Preview {
    SearchDestinationView(show: .constant(false))
}

struct CollapsedPickerView: View {
    let title : String
    let description : String
    
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
