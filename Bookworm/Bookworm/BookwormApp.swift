//
//  BookwormApp.swift
//  Bookworm
//
//  Created by mac on 02/11/24.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
        
    }
}
