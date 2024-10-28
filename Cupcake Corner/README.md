Here’s a `README.md` template to guide users through your **Cupcake Corner** project with SwiftUI and Codable features.


# 🍰 Cupcake Corner - SwiftUI App

Cupcake Corner is a SwiftUI-based app built to take and manage cupcake orders while showcasing techniques like Codable, URLSession, and data persistence with UserDefaults. This project is part of the #100DaysOfSwiftUI challenge.

## 📱 Project Overview

Cupcake Corner demonstrates how to create a seamless order management system using:
- Form-based input for user data
- Codable for encoding/decoding data for network requests
- URLSession for fetching and sending data to a server
- AsyncImage for loading images from the web
- Persistence using `UserDefaults` for saving/loading addresses

## 🎨 Features

- **Place Orders**: Users can select the type and quantity of cupcakes, add special requests, and provide a delivery address.
- **Save Address**: Users can save delivery addresses for faster future orders.
- **Order Validation**: Fields are validated to ensure complete information before placing an order.
- **Remote Image Loading**: Using `AsyncImage` for a dynamic display of cupcake images from a URL.

## 🛠 Technologies Used

- **SwiftUI**: To create a modern and responsive UI.
- **Codable**: For encoding and decoding Swift data structures to JSON.
- **URLSession**: To manage network requests for sending and receiving order data.
- **UserDefaults**: To save and load delivery addresses.
- **Core Haptics**: Adds a more interactive experience with haptic feedback on supported devices.

## 📂 Project Structure

- **Model.swift**: Defines `Order` and `Address` classes with Codable conformance for data handling and API communication.
- **AddressView.swift**: Manages user input for delivery details and includes the ability to save and load addresses.
- **SavedAddressesView.swift**: Displays a list of saved addresses, allowing users to select a saved address for their order.
- **CheckoutView.swift**: Shows a summary of the user’s order and manages the final order placement.

## 📋 Setup Instructions

1. **Clone the Repository**:  
   ```bash
   git clone https://github.com/ashut08/100daysSwiftUIChallenge.git
   cd cupcake-corner
   ```

2. **Open in Xcode**: Open `Cupcake Corner.xcodeproj` in Xcode.

3. **Run the Project**: Select a simulator or device and press `Run`.

4. **Save Address Functionality**: The app uses `UserDefaults` to persist addresses. Toggle the “Save this address” switch, and the app will store or remove the current address from saved addresses.

## 🧩 Key Code Snippets

### Codable with Observable Properties
Defines a custom `Order` class conforming to Codable for encoding/decoding data for API interaction.
```swift
@Observable
class Order: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    var type = 0
    var quantity = 3
    var extraFrosting = false
    var addSprinkles = false
    var address = Address()

    // CodingKeys Enum for Customized Codable Implementation
    enum CodingKeys: String, CodingKey {
        case type, quantity, extraFrosting, addSprinkles, specialRequestEnabled, address
    }
}
```

### Address Selection and Callback
`AddressView` populates address fields when a saved address is selected in `SavedAddressesView`.
```swift
 Section {
                    NavigationLink("Saved Addresses"){
                        SavedAddressesView(onSelectAddress: { selectedAddress in
                            order.setAddress(selectedAddress) // Set selected address directly

                        })
                    }
                    
                }
```

## 🚀 Future Improvements

- Add server-side persistence for orders and addresses.
- Add more complex validation for user inputs.
- Implement dynamic images based on the cupcake selection.

## 💡 Learning Points

1. Using `@Observable` for real-time updates in SwiftUI.
2. Understanding Codable’s `CodingKeys` for encoding/decoding custom objects.
3. Working with `URLSession` to fetch data from remote sources.
4. Implementing async image loading and placeholder views with `AsyncImage`.
5. Using `UserDefaults` to store lists and retrieve specific data, such as saved addresses.

## 📸 Screenshots

| Order Screen       | Address Screen     | Saved Address Screen | Checkout Screen   | Checkout Alert   |
|--------------------|--------------------|-----------------------|-------------------|------------------|
| <p align="center"><img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/refs/heads/main/Cupcake%20Corner/screenshot/order.png" width="300"/></p> | <p align="center"><img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/refs/heads/main/Cupcake%20Corner/screenshot/adress.png" width="300"/></p> | <p align="center"><img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/refs/heads/main/Cupcake%20Corner/screenshot/saved_address.png" width="300"/></p> | <p align="center"><img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/refs/heads/main/Cupcake%20Corner/screenshot/checkout.png" width="300"/></p> | <p align="center"><img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/refs/heads/main/Cupcake%20Corner/screenshot/checkout_alert.png" width="300"/></p> |





