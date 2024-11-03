//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by mac on 03/11/24.
//
import SwiftUI
struct EmojiRatingView: View {
    let rating: Int

    var body: some View {
        switch rating {
        case 1:
            Text("😞") // Emoji for rating 1
        case 2:
            Text("😕") // Emoji for rating 2
        case 3:
            Text("😐") // Emoji for rating 3
        case 4:
            Text("😊") // Emoji for rating 4
        default:
            Text("😄") // Emoji for rating 5 or any other
        }
    }

}

#Preview {
    EmojiRatingView(rating: 3)
}
