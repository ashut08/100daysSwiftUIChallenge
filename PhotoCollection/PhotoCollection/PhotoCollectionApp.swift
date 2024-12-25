//
//  PhotoCollectionApp.swift
//  PhotoCollection
//
//  Created by mac on 24/12/24.
//

import SwiftUI
import SwiftData

@main
struct PhotoCollectionApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            PhotoMemory.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: PhotoMemory.self)

        
    }
}
