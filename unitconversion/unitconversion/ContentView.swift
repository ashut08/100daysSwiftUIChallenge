//
//  ContentView.swift
//  unitconversion
//
//  Created by Ashutosh Singh on 24/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedConverter = "Temp"
    @State private var inputValue=0.0
       @State private var selectedInputUnit = "°C"
       @State private var selectedOutputUnit = "°F"
    
    let listOfConverter = [
        "Temp": ["°C", "°F", "°K"],
        "Length": ["m", "km", "ft", "yd", "mi"],
        "Time": ["s", "min", "hrs", "days"],
        "Volume": ["mL", "L", "gal"]
    ]
    
    func  convertUnit() -> Double {
      

        var convertedValue = inputValue

        switch selectedConverter {
        case "Temp":
            switch (selectedInputUnit, selectedOutputUnit) {
            case ("°C", "°F"):
                convertedValue = (inputValue * 9/5) + 32
            case ("°F", "°C"):
                convertedValue = (inputValue - 32) * 5/9
            case ("°C", "°K"):
                convertedValue = inputValue + 273.15
            case ("°K", "°C"):
                convertedValue = inputValue - 273.15
            // Add more temperature conversions as needed
            default:
                print("Unsupported temperature conversion")
            }
            
        case "Length":
            switch (selectedInputUnit, selectedOutputUnit) {
            case ("m", "km"):
                convertedValue = inputValue / 1000
            case ("km", "m"):
                convertedValue = inputValue * 1000
            case ("ft", "m"):
                convertedValue = inputValue / 3.2808
            case ("m", "ft"):
                convertedValue = inputValue * 3.2808
            // Add more length conversions as needed
            default:
                print("Unsupported length conversion")
            }

        case "Time":
            switch (selectedInputUnit, selectedOutputUnit) {
            case ("s", "min"):
                convertedValue = inputValue / 60
            case ("min", "s"):
                convertedValue = inputValue * 60
            case ("min", "hrs"):
                convertedValue = inputValue / 60
            case ("hrs", "min"):
                convertedValue = inputValue * 60
            case ("hrs", "days"):
                convertedValue = inputValue / 24
            case ("days", "hrs"):
                convertedValue = inputValue * 24
            // Add more time conversions as needed
            default:
                print("Unsupported time conversion")
            }

        case "Volume":
            switch (selectedInputUnit, selectedOutputUnit) {
            case ("mL", "L"):
                convertedValue = inputValue / 1000
            case ("L", "mL"):
                convertedValue = inputValue * 1000
            case ("gal", "L"):
                convertedValue = inputValue * 3.78541
            case ("L", "gal"):
                convertedValue = inputValue / 3.78541
            // Add more volume conversions as needed
            default:
                print("Unsupported volume conversion")
            }

        default:
            print("Unsupported conversion type")
        }
        
        return convertedValue;
    }

    
    
    var body: some View {
        NavigationView {
                    Form {
                        
                        Section(header: Text("Enter Value to Convert")) {
                            TextField("Enter value",value: $inputValue,format: .number)
                                .keyboardType(.decimalPad)
                        }
                        // Picker for selecting the conversion category
                        Section(header: Text("Select Conversion Type")) {
                            Picker("Conversion Type", selection: $selectedConverter) {
                                ForEach(listOfConverter.keys.sorted(), id: \.self) { converter in
                                    Text(converter)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                        
                        // Picker for selecting the input unit
                        Section(header: Text("Input Unit")) {
                            Picker("Input Unit", selection: $selectedInputUnit) {
                                ForEach(listOfConverter[selectedConverter] ?? [], id: \.self) { unit in
                                    Text(unit.uppercased())
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                        
                        // Picker for selecting the output unit
                        Section(header: Text("Output Unit")) {
                            Picker("Output Unit", selection: $selectedOutputUnit) {
                                ForEach(listOfConverter[selectedConverter] ?? [], id: \.self) { unit in
                                    Text(unit.uppercased())
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                        
                        Section(header: Text("Result")) {
                            Text( convertUnit(), format: .number)
                        }
                    }
                    .navigationTitle("Unit Converter")
                }
    }
    
    
    
}

#Preview {
    ContentView()
}
