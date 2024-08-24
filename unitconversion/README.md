# Unit Conversion App

A simple and intuitive SwiftUI-based app that allows users to convert values between different units of measurement. This app supports conversion for temperature, length, time, and volume, making it a versatile tool for various conversion needs.
![unitconverter](https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/main/unitconversion/unitcoverter.png)
## Features

- **Temperature Conversion**: Convert between Celsius, Fahrenheit, and Kelvin.
- **Length Conversion**: Convert between meters, kilometers, feet, yards, and miles.
- **Time Conversion**: Convert between seconds, minutes, hours, and days.
- **Volume Conversion**: Convert between milliliters, liters, and gallons.
- **Responsive Design**: The app layout adapts to different device sizes and orientations.
- **Real-Time Conversion**: The app updates the conversion result as you type.

## How It Works

1. **Select Conversion Type**: Choose the type of conversion (Temperature, Length, Time, Volume) from the segmented control at the top of the screen.

2. **Select Input and Output Units**: Once a conversion type is selected, choose the input unit and output unit using the provided pickers.

3. **Enter Value**: Enter the value you want to convert in the text field. The app will automatically calculate and display the converted value.

## Code Overview

### Key Components

- **State Management**: The app uses `@State` properties to manage the selected conversion type, input unit, output unit, and user input.
- **Conversion Logic**: The conversion logic is handled in the `convertUnit` function, which uses if-else statements to determine the correct conversion based on the selected units.
- **UI Elements**: The app uses SwiftUI components like `Picker`, `TextField`, and `Form` to create a user-friendly interface.

### Example Code Snippet

Here’s a snippet showing how the app handles conversion between units:

```swift
func convertUnit(inputValue: Double) -> Double? {
    var convertedValue = inputValue

    if selectedConverter == "Temp" {
        if selectedInputUnit == "°C" && selectedOutputUnit == "°F" {
            convertedValue = (inputValue * 9/5) + 32
        } else if selectedInputUnit == "°F" && selectedOutputUnit == "°C" {
            convertedValue = (inputValue - 32) * 5/9
        } else if selectedInputUnit == "°C" && selectedOutputUnit == "°K" {
            convertedValue = inputValue + 273.15
        } else if selectedInputUnit == "°K" && sel
ectedOutputUnit == "°C" {
            convertedValue = inputValue - 273.15
        } else {
            return nil // Unsupported temperature conversion
        }
    }
    // Additional conversion logic for Length, Time, and Volume
    return convertedValue
}


