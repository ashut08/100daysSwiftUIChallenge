//
//  ResortView.swift
//  SnowSeeker
//
//  Created by mac on 17/02/25.
//

import SwiftUI
struct ResortView: View {
    let resort: Resort
    
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @State private var selectedFacility: Facility?
    
    @Environment(Favorites.self) var favorites

    @State private var showingFacility = false
  
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
            
                Text("Pic Credits [\(resort.imageCredit)]")    .frame(maxWidth: .infinity, alignment: .center)
                Spacer(minLength: 10)
                   
                HStack {
                    if horizontalSizeClass == .compact  && dynamicTypeSize > .large {
                        VStack(spacing: 10){
                            ResortDetailView(resort: resort)
                        }
                        VStack(spacing: 10){
                            SkiDetailsView(resort: resort)
                        }
                    }
                    else{
                        ResortDetailView(resort: resort)
                        SkiDetailsView(resort: resort)
                    }
                    
                    
                }
                .padding(.vertical)
                .background(.primary.opacity(0.1))
                
                Group {
                    Text(resort.description)
                        .padding(.vertical)
                    
                    Text("Facilities")
                        .font(.headline)
                    
                    ForEach(resort.facilityTypes) { facility in
                        Button {
                            selectedFacility = facility
                            showingFacility = true
                        } label: {
                            facility.icon
                                .font(.title)
                        }
                    }
                    
                    
                        .padding(.horizontal)
                }
                Button(favorites.contains(resort) ? "Remove from Favorites" : "Add to Favorites") {
                    if favorites.contains(resort) {
                        favorites.remove(resort)
                    } else {
                        favorites.add(resort)
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
            .navigationTitle("\(resort.name), \(resort.country)")
            .navigationBarTitleDisplayMode(.inline).alert(selectedFacility?.name ?? "More information", isPresented: $showingFacility, presenting: selectedFacility) { _ in
            } message: { facility in
                Text(facility.description)
            }
        }
    }
}
