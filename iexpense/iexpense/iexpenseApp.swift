//
//  iexpenseApp.swift
//  iexpense
//
//  Created by Ashutosh Singh on 23/09/24.
//

import SwiftUI
import SwiftData
@main
struct iexpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: ExpenseItem.self)
    }
}
