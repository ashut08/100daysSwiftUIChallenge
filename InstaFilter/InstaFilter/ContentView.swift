//
//  ContentView.swift
//  InstaFilter
//
//  Created by mac on 17/11/24.
//

import SwiftUI
import PhotosUI
import CoreImage
import CoreImage.CIFilterBuiltins
import StoreKit

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItem: PhotosPickerItem?
    @State private var currentFilter: CIFilter = CIFilter.pixellate()
    @State private var showingFilters = false
    @State private var filterRadius = 0.5
    @State private var filterScale = 0.5

    

    let context = CIContext()
    let example = Image(.example)
    var body: some View {
        NavigationStack {
            VStack {
                
                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Import a photo to get started"))
                    }
                }.onChange(of: selectedItem, loadImage)
                Spacer()
            
                // image area

                Spacer()

                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity).onChange(of: filterIntensity, applyProcessing)
                }
                .padding(.vertical)
                
                if currentFilter.inputKeys.contains(kCIInputRadiusKey) {
                       HStack {
                           Text("Radius")
                           Slider(value: $filterRadius)
                               .onChange(of: filterRadius, applyProcessing)
                       }
                   }
                   
                   // Scale Slider
                   if currentFilter.inputKeys.contains(kCIInputScaleKey) {
                       HStack {
                           Text("Scale")
                           Slider(value: $filterScale)
                               .onChange(of: filterScale, applyProcessing)
                       }
                   }
               

                HStack {
                    Button("Change Filter") {
                        changeFilter()
                    }

                    Spacer()

                    if let processedImage {
                        ShareLink(item: processedImage, preview: SharePreview("Instafilter image", image: processedImage))
                    }
                }
                
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter").confirmationDialog("Select a filter", isPresented: $showingFilters) {
                Button("Crystallize") { setFilter(CIFilter.crystallize()) }
                Button("Edges") { setFilter(CIFilter.edges()) }
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                Button("Vignette") { setFilter(CIFilter.vignette()) }
                Button("Comic Effect") { setFilter(CIFilter.comicEffect()) }
                Button("Bloom") { setFilter(CIFilter.bloom()) }
                Button("Color Invert") { setFilter(CIFilter.colorInvert()) }

                Button("Cancel", role: .cancel) { }
            }
        }
    }
    func changeFilter() {
        showingFilters=true
    }
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }
            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            applyProcessing()
        }
    }
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys

        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterRadius * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterScale * 10, forKey: kCIInputScaleKey)
        }

        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }

        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }
   
}
#Preview {
    ContentView()
}
