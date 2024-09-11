import SwiftUI

struct ContentView: View {
    @State private var listOfString = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    @State private var score = 0
    @State private var roundCount = 0

    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord).onSubmit {
                        withAnimation {
                            addNewWord()
                        }
                    }
                    .autocapitalization(.none)
                }

                Section("Your words") {
                    ForEach(listOfString, id: \.self) { word in
                        Text(word)
                    }
                }
            }
            .navigationTitle("\(rootWord) - Score: \(score)")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Restart Game", action: startGame)
                }
            }
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
        }
    }

    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // Ensure the word has at least three letters
        guard answer.count >= 3 else {
            wordError(title: "Word too short", message: "Words must be at least 3 letters long.")
            return
        }

        // Ensure the word isn't the same as the root word
        guard answer != rootWord else {
            wordError(title: "Word is the same", message: "You can't use the root word!")
            return
        }

        // Ensure the word hasn't been used already
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original!")
            return
        }

        // Ensure the word can be made from the root word
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }

        // Ensure the word is a valid English word
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up!")
            return
        }

        // Add the word to the list and increment the score
        listOfString.insert(answer, at: 0)
        score += answer.count // Scoring based on word length
        roundCount += 1
        newWord = ""

        // Optional: stop the game after a certain number of rounds
        if roundCount >= 8 {
            wordError(title: "Game Over", message: "You've completed 8 rounds! Your final score is \(score).")
            startGame()
        }
    }

    func startGame() {
        // 1. Find the URL for start.txt in our app bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. Load start.txt into a string
            if let startWords = try? String(contentsOf: startWordsURL) {
                // 3. Split the string up into an array of strings, splitting on line breaks
                let allWords = startWords.components(separatedBy: "\n")

                // 4. Pick one random word, or use "silkworm" as a sensible default
                rootWord = allWords.randomElement() ?? "silkworm"

                // Reset the game state
                listOfString.removeAll()
                score = 0
                roundCount = 0
                newWord = ""
                return
            }
        }
    }

    func isOriginal(word: String) -> Bool {
        !listOfString.contains(word)
    }

    func isPossible(word: String) -> Bool {
        var tempWord = rootWord

        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }

    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }

    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}
