//
//  ContentView.swift
//  betterRest
//
//  Created by Ashutosh Singh on 02/09/24.
//

import SwiftUI
import CoreML
struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    @State private var bedtime = ""
    var body: some View {
        NavigationStack{
            
            Form {
                Section("When do you want to wake up?"){
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden().onChange(of: wakeUp) {
                            calculateBedtime()
                        }
                }
             

                Section("Desired amount of sleep"){
                    Stepper("\(sleepAmount.formatted()) hrs", value: $sleepAmount, in: 4...12).onChange(of: sleepAmount) {
                        calculateBedtime()
                    }
                }
                     
                
                Section("Daily coffee intake"){
                    Picker("Number of cups", selection: $coffeeAmount) {
                         ForEach(1..<21) { number in
                             Text("\(number) \(number == 1 ? "cup" : "cups")")
                         }
                     }
                     .pickerStyle(WheelPickerStyle()).onChange(of: coffeeAmount) {
                         calculateBedtime()
                     }
                }
                Section {
                                    Text("Your ideal bedtime is:")
                                        .font(.headline)

                                    Text(bedtime)
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .padding()
                                }
               

               
                    .navigationTitle("Better Rest")
                   
            }
    
        }
    }
    
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try CalculateSleepTime(configuration: config)
            let components=Calendar.current.dateComponents([.hour,.second], from:wakeUp )
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
        
            
           bedtime = sleepTime.formatted(date: .omitted, time: .shortened)
            // more code here
        } catch {
            // something went wrong!
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
    
        }
        showingAlert=true
    }
}

#Preview {
    ContentView()
}
