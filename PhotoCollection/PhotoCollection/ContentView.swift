import SwiftUI
import SwiftData
import PhotosUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var photoData: Data? = nil
    @State private var isPresented: Bool = false
    @State private var photoName: String = ""
    @State private var navigationPath = NavigationPath()
    let locationFetcher = LocationFetcher()
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack(spacing: 30) {
           
                Text("📸 Photo Collection")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.top)

               
                PhotosPicker(selection: $selectedItem, matching: .images) {
                    Text("Select a Photo")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .onChange(of: selectedItem) { oldValue, item in
                    Task {
                        if let data = try? await item?.loadTransferable(type: Data.self) {
                            photoData = data
                          
                            isPresented = true
                        }
                    }
                }

                if let data = photoData, let image = UIImage(data: data) {
                    VStack {
                        Text("Selected Photo")
                            .font(.title3)
                            .bold()
                            .padding(.bottom, 10)

                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 300)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                    }
                } else {
                    Text("No photo selected yet.")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }

                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink(destination: PhotoMemoryListView()) {
                        Text("View Saved Photos")
                    }
                    .buttonStyle(.borderedProminent)

                    Button(action: {
                        let location = locationFetcher.lastKnownLocation
                        
                        savePhoto(photoData, name: photoName,location: location)
                    }) {
                        Text("Save Photo")
                    }
                    .disabled(photoData == nil)
                    .buttonStyle(.bordered)
                }
            }
            .navigationTitle("Photo Collection")
        }
        .sheet(isPresented: $isPresented) {
            AddPhotNameView(photoName: $photoName, isPresented: $isPresented) { newName in
            }
        }.onAppear() {
            locationFetcher.start()
        }
    }

    private func savePhoto(_ data: Data?, name: String, location: CLLocationCoordinate2D?) {
        guard let photoData = data else { return }

        let newPhotoMemory = PhotoMemory(name: name, photo: photoData, latitude: location?.latitude,
                                         longitude: location?.longitude)

        modelContext.insert(newPhotoMemory)
        print("Photo saved with name: \(name)")

        do {
            try modelContext.save()
            print("Context saved successfully.")
        } catch {
            print("Failed to save context: \(error.localizedDescription)")
        }

   
        self.photoData = nil
    }
}

#Preview {
    ContentView()
}
