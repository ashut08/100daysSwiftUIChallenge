//
//  Hot_ProspectsApp.swift
//  Hot Prospects
//
//  Created by mac on 30/12/24.
//

import SwiftUI
import SwiftData

@main
struct Hot_ProspectsApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Prospect.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
