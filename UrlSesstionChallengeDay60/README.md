

SwiftUI app built as part of Day 60 of the #100DaysOfSwiftUI challenge. This project showcases **networking with URLSession**, **JSON parsing with Codable**, and an enhanced user interface using **SwiftUI components** like `NavigationStack`, `List`, `Form`, and more.

## 🚀 Features

- **Fetch Data from API**: Uses `URLSession` to fetch user data from the [FriendFace API](https://www.hackingwithswift.com/samples/friendface.json).
- **User List**: Displays a list of users with their names and online/offline status.
- **User Details**: Shows detailed information about each user, including tags and friends.
- **Dynamic UI**: Uses `NavigationLink`, `Form`, `ScrollView`, and custom views for a polished look.
- **Error Handling**: Handles network errors gracefully with error messages.

## 🛠️ Technologies Used

- **SwiftUI**: For building the user interface.
- **URLSession**: For network requests and fetching data.
- **Codable**: For decoding JSON data.
- **NavigationStack & List**: For easy navigation and displaying lists.
- **SwiftData**: For future enhancements like data persistence.

## 📦 Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/ashut08/100daysSwiftUIChallenge.git
   
   ```

2. **Open the project in Xcode**:
   ```bash
   cd FriendFace
   open FriendFace.xcodeproj
   ```

3. **Build and run the app** on the iOS simulator or your iOS device.

## 💻 Usage

1. Launch the app to view a list of users fetched from the FriendFace API.
2. Tap on any user to view detailed information about them.
3. Check the online/offline status, user details, tags, and friends list.
4. Navigate back to the main list using the navigation bar.

## 📸 Screenshots

| User List View | User Detail View |
|----------------|------------------|
|  <img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/refs/heads/main/UrlSesstionChallengeDay60/Screenshot/userlist.png" alt="userlist" width="300"/> |   <img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/refs/heads/main/UrlSesstionChallengeDay60/Screenshot/userdetail.png" alt="userdetail" width="300"/> |

## 🗂️ Project Structure

```plaintext
FriendFace/
├── Models/
│   ├── UserModel.swift
├── Views/
│   ├── ContentView.swift
│   ├── UserListView.swift
│   ├── UserDetailView.swift
│   ├── FriendView.swift
├── Assets.xcassets/
├── Info.plist
└── README.md
```

- **Models**: Contains the data models (`UserModel`, `FriendModel`) using `Codable` for JSON decoding.
- **Views**: SwiftUI views for different parts of the app (list, details, etc.).
- **Networking**: Handles data fetching using `URLSession`.

## 🔍 API Reference

The app fetches data from the following API endpoint:

- **FriendFace API**: [https://www.hackingwithswift.com/samples/friendface.json](https://www.hackingwithswift.com/samples/friendface.json)
  - Returns a list of users with details like `id`, `name`, `age`, `company`, `address`, `isActive`, `tags`, and `friends`.

## 📚 Learning Outcomes

- Mastered the use of `URLSession` for network requests.
- Parsed complex JSON data using `Codable`.
- Enhanced UI with dynamic elements using SwiftUI components.
- Implemented navigation using `NavigationStack` and `List`.
- Demonstrated error handling and state management in SwiftUI.

## 🔥 Challenges & Improvements

- **Error Handling**: Added basic error handling, but future versions could include more detailed user feedback.
- **Data Persistence**: Currently fetches data from the network every time the app launches. Future versions could use `SwiftData` for caching.
