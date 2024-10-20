Here’s a ready-to-use `README.md` file that you can copy and paste directly into your project repository without needing to make any changes:


# Habit Tracker App

This is a SwiftUI-based Habit Tracker app that allows users to track and manage their daily habits. Users can add activities they want to track, view details about each activity, mark them as completed, and see how many times each activity has been completed. The app also supports deleting and reordering activities, and all data is persisted using `UserDefaults`.

## Features

- **Add New Activities**: Users can create a new activity by providing a title and description.
- **View Activity Details**: Users can tap on an activity to view its details, including how many times the activity has been completed.
- **Mark Activity as Completed**: Users can increment the completion count of an activity by marking it as completed.
- **Delete Activities**: Users can delete any activity they no longer wish to track.
- **Reorder Activities**: Users can reorder the list of activities to prioritize specific ones.
- **Data Persistence**: The app uses `UserDefaults` to save and load activities, ensuring data persists between app sessions.

## Screenshots

### Main Screen
<p align="center">
  <img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/refs/heads/main/HabitTracker/Screenshot/main_screen.png" alt="edutainement" width="300"/>
</p>


### Add Activity Screen
<p align="center">
  <img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/refs/heads/main/HabitTracker/Screenshot/add_new.png" alt="edutainement" width="300"/>
</p>


### Activity Detail Screen
<p align="center">
  <img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/refs/heads/main/HabitTracker/Screenshot/activity_detail.png" alt="edutainement" width="300"/>
</p>


## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/habit-tracker-app.git
   ```

2. Open the project in Xcode:
   ```bash
   cd habit-tracker-app
   open HabitTracker.xcodeproj
   ```

3. Run the app on your iOS simulator or device.

## How to Use

1. **Adding an Activity**: Tap the "+" button on the main screen to add a new activity. Provide a title and description for the habit you'd like to track.
   
2. **Viewing and Completing an Activity**: Tap on an activity to view its details. On the details screen, tap the "Mark Completed" button to increment the completion count.

3. **Deleting and Reordering**: Swipe left on an activity to delete it, or use the "Edit" button to reorder your activities.

## Code Structure

- `ContentView.swift`: The main view where users can see their list of activities, add new activities, delete or reorder them, and navigate to the detail view.
  
- `AddActivityView.swift`: The view that allows users to add a new activity by entering a title and description.
  
- `ActivityDetailView.swift`: Displays detailed information about the selected activity and allows users to mark it as completed.

- `ActivityViewModel.swift`: Manages the list of activities and handles data persistence using `UserDefaults`.

- `ActivityModel.swift`: Defines the data model for an activity with properties such as `title`, `description`, and `completeCount`.

## Persistence

The app uses `UserDefaults` to store the list of activities. Each activity is encoded to JSON and stored, allowing it to persist across app launches.

## Future Improvements

- **Custom Colors for Activities**: Add the ability to assign colors to each activity for better visual differentiation.
- **Notifications**: Implement reminders for users to complete their activities.
- **Streak Tracking**: Track how many consecutive days a habit has been completed.

