import SwiftData
import SwiftUI

struct UsersView: View {
    @Query var users: [User]

    var body: some View {
        List(users) { user in
            Text(user.name)
        }
    }

    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(
            filter: #Predicate<User> { user in
                user.joinDate >= minimumJoinDate
            },
            sort: sortOrder
        )
    }
}
