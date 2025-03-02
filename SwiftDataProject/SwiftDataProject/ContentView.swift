//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by mac on 08/11/24.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<User> {user in user.name.localizedStandardContains("R") && user.city=="London"}, sort: \User.name) var users: [User]
    @State private var path = [User]()
    
    var body: some View {
        NavigationStack(path: $path) {
            List(users) { user in
                NavigationLink(value: user) {
                    Text(user.name)
                }
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                EditUserView(user: user)
            }.toolbar {
                Button("Add User", systemImage: "plus") {
                    let user = User(name: "", city: "", joinDate: .now)
                    modelContext.insert(user)
                    path = [user]
                    let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                              let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                              let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                              let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))

                              modelContext.insert(first)
                              modelContext.insert(second)
                              modelContext.insert(third)
                              modelContext.insert(fourth)
                }
            }
        }
    }
    
}

#Preview {
    ContentView()
}

@Model
class User {
    var name: String
    var city: String
    var joinDate: Date

    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
