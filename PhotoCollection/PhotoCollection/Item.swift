//
//  Item.swift
//  PhotoCollection
//
//  Created by mac on 24/12/24.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class PhotoMemory: Identifiable {
    var id = UUID()
    var name: String
    var latitude: Double?
      var longitude: Double?
    @Attribute(.externalStorage) var photo: Data
    
    init(name: String, photo: Data, latitude: Double? = nil, longitude: Double? = nil) {
           self.name = name
           self.photo = photo
           self.latitude = latitude
           self.longitude = longitude
       }
}
