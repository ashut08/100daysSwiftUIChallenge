import Foundation

class ActivityViewModel: ObservableObject {
    @Published var activities: [ActivityModel] = [] {
        didSet {
            saveActivities() // Automatically save when activities change
        }
    }

    // Key to save activities in UserDefaults
    private let activitiesKey = "SavedActivities"

    // Initializer to load existing activities from UserDefaults
    init() {
        loadActivities()
    }

    // Method to add a new activity
    func addActivity(title: String, description: String) {
        let newActivity = ActivityModel(title: title, description: description)
        activities.append(newActivity)
    }

    // Method to delete an activity
    func deleteActivity(at offsets: IndexSet) {
        activities.remove(atOffsets: offsets)
    }

    // Method to reorder activities
    func moveActivity(from source: IndexSet, to destination: Int) {
        activities.move(fromOffsets: source, toOffset: destination)
    }

    // Method to mark an activity as completed
    func completeActivity(_ activity: ActivityModel) {
        if let index = activities.firstIndex(where: { $0.id == activity.id }) {
            activities[index].completeCount += 1
            print("Updated count: \(activities[index].completeCount)")
            saveActivities() // Save to UserDefaults to persist changes
        }
    }

    // MARK: - Persistence Methods

    // Save activities to UserDefaults
    private func saveActivities() {
        if let encodedData = try? JSONEncoder().encode(activities) {
            UserDefaults.standard.set(encodedData, forKey: activitiesKey)
        }
    }

    // Load activities from UserDefaults
    private func loadActivities() {
        if let savedData = UserDefaults.standard.data(forKey: activitiesKey) {
            if let decodedData = try? JSONDecoder().decode([ActivityModel].self, from: savedData) {
                activities = decodedData
            }
        }
    }
}
