import SwiftUI

struct UserDetailView: View {
    var user: UserModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("User Information")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Name: \(user.name ?? "Unknown")")
                            .font(.headline)

                        Text("Email: \(user.email ?? "Not Available")")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Text("Address: \(user.address ?? "Not Available")")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Text(user.about ?? "No additional information")
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .shadow(radius: 3)
                }
                .padding()

                VStack(alignment: .leading, spacing: 10) {
                    Text("Tags")
                        .font(.title2)
                        .fontWeight(.bold)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(user.tags ?? [], id: \.self) { tag in
                                Text(tag)
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 5)
                                    .background(
                                        Capsule()
                                            .fill(Color.blue.opacity(0.7))
                                    )
                                    .foregroundColor(.white)
                                    .shadow(radius: 2)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)

                // Friends Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Friends")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    FriendView(friends: user.friends ?? [])

                   
                }
                .padding(.horizontal)
            }
            .padding(.top)
        }
        .navigationTitle(user.name ?? "User Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
