//
//  UserListView.swift
//  UrlSesstionChallengeDay60
//
//  Created by mac on 10/11/24.
//
import SwiftUI

struct UserListView: View {
    var user: UserModel

    var body: some View {
        HStack {
          
            ZStack(alignment: .bottomTrailing) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)

                Circle()
                    .fill(user.isActive==true ? Color.green : Color.red)
                    .frame(width: 12, height: 12)
                    .offset(x: 5, y: 5)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text(user.name ?? "Unknown")
                    .font(.headline)

                Text(user.isActive==true ? "Online" : "Offline")
                    .font(.caption)
                    .padding(10)
                    .background(user.isActive == true ? Color.green.opacity(0.2) : Color.red.opacity(0.2))
                    .foregroundColor(user.isActive==true ? .green : .red)
                    .clipShape(Capsule())
            }

            
        }
        .padding(.vertical, 8)
    }
}
