
# 📚 Bookworm

**Bookworm** is a book tracking app developed using SwiftUI and SwiftData as part of the #100DaysOfSwiftUI challenge. This app allows users to log books, provide ratings, write reviews, and track their reading history in a simple, user-friendly interface.

## 📝 Features

- **Book Logging**: Add books with titles, authors, genres, and reviews.
- **Star Rating Component**: Customizable rating feature using emojis and stars to rate each book.
- **Genre-Specific Images**: Displays an image based on the selected book genre.
- **Detailed Book View**: Each book entry provides detailed information including rating, review, genre, and the date it was added.
- **Highlighting Low Ratings**: Books rated with 1 star are highlighted for easy identification.
- **Persistent Storage**: Data is stored using SwiftData, ensuring that books are retained across app launches.
- **Form Validation**: Ensures valid data for title, author, and genre.
- **Delete & Sort**: Options to delete and sort book entries.

## 📸 Screenshots

| Home Screen | Add Book | Book Details |
|-------------|----------|--------------|
| ![Home](screenshots/home.png) | ![Add Book](screenshots/add_book.png) | ![Book Details](screenshots/book_details.png) |

## 🚀 Getting Started

### Prerequisites

- iOS 16 or later
- Xcode 14 or later

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/bookworm.git
   ```

2. **Open Xcode**:
   Open `Bookworm.xcodeproj` in Xcode.

3. **Build and Run**:
   Run the app on a simulator or physical device.

## 🧩 Code Highlights

### Custom Rating Component

The app features a custom `CustomRatingView`, allowing users to easily rate books with a star-based UI.

```swift
struct CustomRatingView: View {
    @Binding var rating: Int
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
}
```

### Emoji Rating View

A fun `EmojiRatingView` component displays emojis based on the user’s rating, adding a playful element to the app.

### SwiftData Persistence

The app leverages SwiftData for efficient storage and retrieval, ensuring all book data persists across sessions.

```swift
@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    var timeStamp: Date
}
```

### Data Validation

Form validation ensures users input meaningful data, with empty fields or whitespace-only strings deemed invalid.

## 📈 Future Improvements

- Allow users to edit book entries.
- Enable filtering of books by genre.
- Integrate additional sorting options.

