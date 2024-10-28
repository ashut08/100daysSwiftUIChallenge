import Foundation

// Codable structs for API response handling
struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

@Observable
class Order: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    var type = 0
    var quantity = 3
    var extraFrosting = false
    var addSprinkles = false
    var address = Address()
    var addressList: [Address] = []
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }

    var hasValidAddress: Bool {
        !address.name.trimmingCharacters(in: .whitespaces).isEmpty &&
        !address.streetAddress.trimmingCharacters(in: .whitespaces).isEmpty &&
        !address.city.trimmingCharacters(in: .whitespaces).isEmpty &&
        !address.zipCode.trimmingCharacters(in: .whitespaces).isEmpty
    }

    var cost: Decimal {
        var cost = Decimal(quantity) * 2
        cost += Decimal(type) / 2  // Complicated cakes cost more
        if extraFrosting { cost += Decimal(quantity) }
        if addSprinkles { cost += Decimal(quantity) / 2 }
        return cost
    }


    enum CodingKeys: String, CodingKey {
        case type, quantity, extraFrosting, addSprinkles, specialRequestEnabled, address, addressList
    }

    
    init() {
        loadAddressList()  // Load saved addresses on initialization
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
        specialRequestEnabled = try container.decode(Bool.self, forKey: .specialRequestEnabled)
        address = try container.decode(Address.self, forKey: .address)
        addressList = try container.decodeIfPresent([Address].self, forKey: .addressList) ?? []
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)
        try container.encode(specialRequestEnabled, forKey: .specialRequestEnabled)
        try container.encode(address, forKey: .address)
        try container.encode(addressList, forKey: .addressList)
    }



    func saveAddressList() {
        if let encodedData = try? JSONEncoder().encode(addressList) {
            UserDefaults.standard.set(encodedData, forKey: addressKey)
        }
    }

    func loadAddressList() {
        if let savedData = UserDefaults.standard.data(forKey: addressKey),
           let decodedList = try? JSONDecoder().decode([Address].self, from: savedData) {
            addressList = decodedList
        }
    }
    func setAddress(_ address:Address){
        self.address = address
    }

    func addAddress(_ newAddress: Address) {
        // Add new address and save the updated list
        addressList.append(newAddress)
        saveAddressList()
    }

    func deleteAddress(by id: UUID) {
        // Remove address matching the provided ID and save the updated list
        addressList.removeAll { $0.id == id }
        saveAddressList()
    }
}


struct Address: Codable, Identifiable {
    var id = UUID()
    var name: String = ""
    var streetAddress: String = ""
    var city: String = ""
    var zipCode: String = ""
}
