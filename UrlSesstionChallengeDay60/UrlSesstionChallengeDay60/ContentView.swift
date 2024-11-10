//
//  ContentView.swift
//  UrlSesstionChallengeDay60
//
//  Created by mac on 10/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var userList: [UserModel] = []
    
    
    var body: some View {
          NavigationStack {
              List(userList) { user in
                  NavigationLink(destination: UserDetailView(user: user)) {
                      UserListView(user: user)
                  }
              }
              .navigationTitle("User List") // Set the navigation title here
          }
          .onAppear(perform: fetchUserList)
      }

    
    func fetchUserList() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else { return }
            
            do {
                let data = try JSONDecoder().decode([UserModel].self, from: data)
                print(data)
                userList = data
            } catch {
                print(error)
            }
        }.resume()
        
    }
}

#Preview {
    ContentView()
}
