//
//  ContentView.swift
//  BucketList
//
//  Created by mac on 30/11/24.
//

import SwiftUI
import MapKit
import LocalAuthentication

struct ContentView: View {
   
    @State private var viewModel = ViewModel()
    @State private var isUnlocked = false
    @State private var mapType: MapStyle = .hybrid

 
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 28.4646148, longitude: 77.0299194),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    var body: some View {
      
       
            MapReader { proxy in
                Map(initialPosition: startPosition){
                    ForEach(viewModel.locations) { location in
                        Annotation(location.name, coordinate: location.coordinate) {
                            Image(systemName: "star.circle")
                                .resizable()
                                .foregroundStyle(.red)
                                .frame(width: 44, height: 44)
                                .background(.white)
                                .clipShape(.circle).simultaneousGesture(
                                    LongPressGesture().onEnded { _ in
                                        viewModel.selectedPlace=location
                                    }
                                )
                        }                   }
                }
                
                .onTapGesture {
                    position in  if let coordinate = proxy.convert(position, from: .local) {
                        viewModel.addLocation(at: coordinate)
                    }
                    
                    
                    
                }
            }.sheet(item: $viewModel.selectedPlace) { place in
                EditView(location: place) { newLocation in
                    viewModel.updateLocation(location: newLocation)
                }
            }
        

     
    }
    
   
}

#Preview {
    ContentView()
}
