//
//  ContentViewModel.swift
//  BucketList
//
//  Created by mac on 09/12/24.
//

import Foundation
import CoreLocation
extension ContentView {
 
    @Observable
      class ViewModel {
       var selectedPlace: Location?
         private(set) var locations = [Location]()
          let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")

          init() {
              do {
                  let data = try Data(contentsOf: savePath)
                  locations = try JSONDecoder().decode([Location].self, from: data)
              } catch {
                  locations = []
              }
          }
          func save() {
              do {
                  let data = try JSONEncoder().encode(locations)
                  try data.write(to: savePath, options: [.atomic, .completeFileProtection])
              } catch {
                  print("Unable to save data.")
              }
          }


          func addLocation(at point: CLLocationCoordinate2D){
              let newLocation = Location(id: UUID(), name: "New location", description: "", latitude:point.latitude, longitude: point.longitude)
            locations.append(newLocation)
              save()
          }
          
          func updateLocation(location:Location){
              guard let selectedPlace else { return }
              
              if let index = locations.firstIndex(of: selectedPlace) {
                  locations[index] = location
                  save()
              }
          }
      }
}
