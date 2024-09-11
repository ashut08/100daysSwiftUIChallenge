# WordScramble Game

A fun and interactive word puzzle game built using Swift and SwiftUI! The goal of the game is to create as many unique words as possible from a randomly selected root word. The game ends after a fixed number of rounds, and the player’s score is based on the length of the words they come up with.

<p align="center">
  <img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/main/WordScramble/wordscramble.png" alt="unitconverter" width="300"/>
</p>

## What I Learned

1. **TextField Usage**: I learned how to handle user input using SwiftUI’s `TextField` and dynamically manage changes as users enter new words.
2. **State Management with @State**: I learned how to effectively use `@State` for managing dynamic data, such as tracking the root word, list of valid words, and player score.
3. **List and Dynamic Content**: I learned how to use `List` to display a dynamic list of words that updates automatically when new words are added.
4. **Basic Input Validation**: I learned to validate user input to ensure that words are original, possible from the root word, and recognized in the English dictionary.
5. **Error Handling with Alerts**: I used SwiftUI’s `Alert` system to show messages when the user enters invalid words.
6. **Score Tracking**: I implemented a basic scoring system, which gives points based on the length of the valid words entered by the player.
7. **Navigation and Toolbars**: I used `NavigationStack` and toolbar buttons to allow players to restart the game at any time and improve the game’s overall experience.

## How to Play the Game

1. **Start the Game**: A random word will be displayed at the top of the screen when the game starts.
2. **Enter Words**: Use the text field to type words that can be made from the letters of the root word, and submit them by pressing Enter.
3. **Check Validity**: The game will check if the word is original, possible from the root word, and a real word. If valid, the word will be added to the list, and you’ll score points.
4. **Track Your Score**: The score increases based on the length of the valid words you submit.
5. **Restart Game**: Tap the "Restart Game" button to begin again with a new random word.

Enjoy the WordScramble game and test your vocabulary skills!
