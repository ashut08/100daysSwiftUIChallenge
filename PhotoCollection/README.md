# Photo Memory App

<p align="center">

  <img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/refs/heads/main/PhotoCollection/Screenshot/Home.png" alt="home" width="300"/>
   <img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/refs/heads/main/PhotoCollection/Screenshot/AfterPhoto.png" alt="home1" width="300"/>
    <img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/refs/heads/main/PhotoCollection/Screenshot/PhotoDetails.png" alt="filters" width="300"/>
      <img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/refs/heads/main/PhotoCollection/Screenshot/PhotoListing.png" alt="share" width="300"/>
          <img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/refs/heads/main/PhotoCollection/Screenshot/EnterPhotoName.png" alt="share" width="300"/>
</p>

## Overview
The Photo Memory App is a SwiftUI-based iOS application that helps users remember names associated with photos. Users can import photos from their library, assign a name to each photo, view a list of named photos, and tap an item to see a full-size version of the picture in a detail view. The app saves data persistently, ensuring photos and names are retained across app launches.



## Features
- **Photo Import:** Users can select photos from their library using the `PhotosPicker`.
- **Name Assignment:** Prompt users to name the imported photo immediately after selection.
- **Photo List:** Display all named photos in an alphabetically sorted list.
- **Detail View:** Show a full-size photo and its name when tapped.
- **Persistent Storage:** Save photo and name data for long-term access.
- **Optional Enhancements:** Include functionality for photo deletion, editing names, and adding search capabilities.

## Requirements
- **Platform:** iOS 16.0+
- **Language:** Swift
- **Frameworks:** SwiftUI, PhotosUI


## Usage
1. Launch the app.
2. Tap the "Add Photo" button to select a photo from your library.
3. Assign a name to the photo when prompted.
4. View the list of named photos on the main screen.
5. Tap on a photo to see a detailed view.

## Data Storage
**SwiftData:** Efficient and scalable storage solution using SwiftData models.

## Key Components
### Models
- `PhotoCollection`: Represents a photo and its associated name.

### Views
- **Main View:** Displays the list of photos and names.
- **Detail View:** Shows the selected photo in full size.


## Accessibility
The app includes VoiceOver support for:
- Reading photo names and counts.
- Navigating between list and detail views.

## Future Enhancements
- Add tagging and categorization of photos.
- Sync data across devices using iCloud.
- Include a search bar to find photos by name.

