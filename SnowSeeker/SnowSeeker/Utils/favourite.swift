import Foundation

@Observable
class Favorites {
    private var resorts: Set<String>

    private let key = "Favorites"

    init() {
        if let savedResorts = UserDefaults.standard.object(forKey: key) as? Set<String> {
            resorts = savedResorts
        } else {
            resorts = []
        }
    }

    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }

    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }

    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }

    func save() {
        UserDefaults.standard.set(resorts, forKey: key)
    }
}
