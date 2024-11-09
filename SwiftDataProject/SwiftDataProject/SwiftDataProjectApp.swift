//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by mac on 08/11/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().modelContainer(for: User.self)
        }
    }
}
