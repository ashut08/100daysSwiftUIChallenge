//
//  ContentView.swift
//  Bookworm
//
//  Created by mac on 02/11/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var rememberMe = false
    
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books: [Book]

    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)

                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundColor(book.rating == 1 ? .red : .primary)
                                
                                Text(timeStamp(timeStamp: book.timeStamp ?? Date.now))
                                
                                
                            }
                        }
                    }
                }.onDelete(perform: deleteBooks)
            }
            .navigationTitle("Bookworm").navigationDestination(for: Book.self) { book in
                BookDetailView(book: book)
            }

                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add Book", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                }
        }
    }
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our query
            let book = books[offset]

            // delete it from the context
            modelContext.delete(book)
        }
    }
    func timeStamp(timeStamp: Date) -> String {
        
      
              let formatter = DateFormatter()
              formatter.dateStyle = .medium
        formatter.timeStyle = .none
            return formatter.string(from: timeStamp)
          
    }
}

#Preview {
    ContentView()
}
