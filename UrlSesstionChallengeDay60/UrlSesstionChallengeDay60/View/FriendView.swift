//
//  FriendView.swift
//  UrlSesstionChallengeDay60
//
//  Created by mac on 10/11/24.
//

import SwiftUI
struct FriendView : View {
    var friends: [Friend] = []
    var body: some View {
        
        ForEach(friends ) { friend in
            HStack(alignment: .top) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.blue)

                VStack(alignment: .leading) {
                    Text(friend.name ?? "Unknown Friend")
                        .font(.headline)

               
                }

 
       
            }.frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .shadow(radius: 2)
        }
        
        
    }
}
