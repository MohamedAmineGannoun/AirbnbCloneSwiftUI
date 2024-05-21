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
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var guests : Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Button(action: {
                    withAnimation(.snappy){
                        show.toggle()
                    }
                }, label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                })
                
                Spacer()
                
                if !destination.isEmpty {
                    
                    Button(action: {
                        destination = ""
                    }, label: {
                        Text("Clear")
                            .foregroundStyle(.black)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    })
                    
                }
                
            }.padding()
            
            
            
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
            VStack(alignment: .leading) {
                
                if selectedOption == .dates {
                    
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                            .onTapGesture(count: 99) {}
                        Divider()
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                            .onTapGesture(count: 99) {}
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    
                    
                }else{
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
                
            }
            .padding()
            .frame(height: selectedOption == .dates ? 180 : 64)
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
                
                if selectedOption == .guests {
                    
                    Text("Who's coming?")
                    
                    Stepper{
                        Text("\(guests) adults")
                    } onIncrement: {
                        guests += 1
                    } onDecrement: {
                        if guests > 0 {
                            guests -= 1
                        }
                    }
                    
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
        
        Spacer()
        
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
