//
//  DetailView.swift
//  PhotoCollection
//
//  Created by mac on 25/12/24.
//

import SwiftUI
import MapKit

struct DetailView: View {
    var photoMemory: PhotoMemory

    var body: some View {
        VStack(spacing: 20) {
            if let uiImage = UIImage(data: photoMemory.photo) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .cornerRadius(15)
                    .shadow(radius: 5)
            }

            VStack(alignment: .leading, spacing: 10) {
                Text("Photo Name:")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                
                Text(photoMemory.name)
                    .font(.title2)
                    .bold()
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)

            if let latitude = photoMemory.latitude, let longitude = photoMemory.longitude {
                Map(coordinateRegion: .constant(MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
                    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                )))
                .frame(height: 250)
                .cornerRadius(15)
                .shadow(radius: 5)
            } else {
                Text("No location data available for this photo.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Photo Details")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}
