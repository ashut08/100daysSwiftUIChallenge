# Better Rest

<p align="center">
  <img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/main/betterRest/betterrest.png" alt="guesstheflag" width="300"/>
</p>


A simple iOS app that helps users determine their optimal bedtime based on their desired wake-up time, amount of sleep, and daily coffee intake. The app uses Core ML to predict the best time for the user to go to bed in order to wake up feeling well-rested.

## Features

- **Wake-Up Time Selection**: Users can select their desired wake-up time using a `DatePicker`.
- **Sleep Amount**: Users can choose how many hours of sleep they would like to get using a `Stepper`.
- **Coffee Intake**: Users can input their daily coffee consumption through a `Picker` with a range from 1 to 20 cups.
- **Dynamic Bedtime Calculation**: The app dynamically calculates and displays the optimal bedtime based on user input, using a machine learning model.
- **Core ML Integration**: The app integrates with a Core ML model to provide personalized predictions for bedtime.

## What I Learned

1. **Core ML Model Integration**:
   - Successfully integrated a Core ML model into a SwiftUI project.
   - Used a pre-trained model to make predictions based on user input.
   - Worked with `MLModelConfiguration` to load and configure the Core ML model.

2. **Reactive SwiftUI Design**:
   - Implemented dynamic UI updates using SwiftUI’s `@State` and `onChange` modifiers.
   - Automatically updated the recommended bedtime whenever the user changed the wake-up time, sleep amount, or coffee intake.
   - Removed the need for a manual "Calculate" button, making the user experience more seamless.

3. **Working with Forms**:
   - Used `Form`, `DatePicker`, `Stepper`, and `Picker` to create an intuitive and functional user interface.
   - Experimented with different layout options (like `Section`) to create a clean and structured form-based UI.

4. **Displaying Results**:
   - Learned to display the output (recommended bedtime) in a visually prominent way using SwiftUI’s text styling capabilities (e.g., `font`, `fontWeight`).

## Technologies Used

- **SwiftUI**: For building the user interface and handling state management.
- **Core ML**: For integrating machine learning models into the app to calculate optimal sleep times.
- **Xcode**: For developing and testing the app.


## How to Run the Project

1. Clone the repository.
2. Open the project in Xcode.
3. Build and run the app on a simulator or physical device.

