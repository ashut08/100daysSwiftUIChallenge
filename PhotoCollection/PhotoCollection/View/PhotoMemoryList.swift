import SwiftData
import SwiftUI

struct PhotoMemoryListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \PhotoMemory.name) private var photoMemories: [PhotoMemory]
    var body: some View {
        VStack {
            if photoMemories.isEmpty {
                Text("No photos available")
                    .foregroundColor(.gray)
                    .italic()
            } else {
                List(photoMemories) { memory in
                    NavigationLink(destination: DetailView(photoMemory: memory)) {
                        HStack {
                            if let uiImage = UIImage(data: memory.photo), !memory.photo.isEmpty {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                            } else {
                                Image(systemName: "photo.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                    .foregroundColor(.gray)
                            }
                            Text(memory.name)
                        }
                    }
                }
            }
        }
        
    }
}
