//
//  AddBookView.swift
//  Bookworm
//
//  Created by mac on 03/11/24.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller","Other"]
    
    func isValid() -> Bool {
        !title.isEmpty || !author.isEmpty || !review.isEmpty
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section("Write a review") {
                    TextEditor(text: $review)
                    CustomRatingView(rating: $rating)
                }

                Section {
                    Button("Save") {
                        let newBook = Book(title: title.isEmpty ? "Untitled" : title, author: author.isEmpty ? "Unknown" : author, genre: genre.isEmpty ? "Unknown" : genre, review:review, rating: rating)
                        modelContext.insert(newBook)
                       
                        dismiss()
                    } .disabled(isValid() == false)
                }
            }
            .navigationTitle("Add Book")
        }
    }
    
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
