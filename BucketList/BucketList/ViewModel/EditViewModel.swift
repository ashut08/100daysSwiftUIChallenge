import Foundation

class EditViewModel: ObservableObject {
    
    @Published var name: String
    @Published var description: String
    @Published private(set) var loadingState = LoadingState.loading
    @Published private(set) var pages = [Page]()
    
    private var location: Location
    
    init(location: Location) {
        self.location = location
        self.name = location.name
        self.description = location.description
    }
    
    func fetchNearbyPlaces() async {
        let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.latitude)%7C\(location.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
        
        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let items = try JSONDecoder().decode(Result.self, from: data)
            // success – convert the array values to our pages array
            pages = items.query.pages.values.sorted()
            loadingState = .loaded
        } catch {
            loadingState = .failed
        }
    }
    
    func getUpdatedLocation() -> Location {
        var updatedLocation = location
        updatedLocation.name = name
        updatedLocation.description = description
        updatedLocation.id = UUID()
        return updatedLocation
    }
}
