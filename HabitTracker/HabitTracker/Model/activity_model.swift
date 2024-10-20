import Foundation

class ActivityModel: Identifiable, ObservableObject, Codable, Hashable {
    var id = UUID()
    var title: String
    var description: String
    @Published var completeCount: Int

    init(title: String, description: String, completeCount: Int = 0) {
        self.title = title
        self.description = description
        self.completeCount = completeCount
    }

    // Codable conformance to store in UserDefaults
    enum CodingKeys: String, CodingKey {
        case id, title, description, completeCount
    }

    // Required methods for Hashable conformance
    static func == (lhs: ActivityModel, rhs: ActivityModel) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    // Codable methods
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        completeCount = try container.decode(Int.self, forKey: .completeCount)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(description, forKey: .description)
        try container.encode(completeCount, forKey: .completeCount)
    }
}
