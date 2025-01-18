//
//  ContentView.swift
//  Hot Prospects
//
//  Created by mac on 30/12/24.
//

import SwiftUI
import SwiftData
import UserNotifications





struct ContentView: View {
   
 

    var body: some View {
        
        TabView {
            ProspectView(filter: .none)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            ProspectView(filter: .contacted)

                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }
            ProspectView(filter: .uncontacted)

                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            MeView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                }
        }
    }
    

   
    }

  


#Preview {
    ContentView()
}
