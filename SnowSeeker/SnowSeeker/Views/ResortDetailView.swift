//
//  ResortDetailView.swift
//  SnowSeeker
//
//  Created by mac on 17/02/25.
//
import SwiftUI

struct ResortDetailView : View {
    let resort:Resort
    var size: String {
        switch resort.size {
        case 1: "Small"
        case 2: "Average"
        default: "Large"
        }
    }
    var price: String {
        String(repeating: "$", count: resort.price)
    }

    var body: some View {
        Group {
                   VStack {
                       Text("Elevation")
                           .font(.caption.bold())
                       Text("\(resort.elevation)m")
                           .font(.title3)
                   }

                   VStack {
                       Text("Snow")
                           .font(.caption.bold())
                       Text("\(resort.snowDepth)cm")
                           .font(.title3)
                   }
               }
               .frame(maxWidth: .infinity)
           }
    
}
