# Multiplication Practice App 🎓

<p align="center">
  <img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/main/edutainment/edutainement.gif" alt="edutainement" width="300"/>
</p>


## Overview

This project is a **fun and interactive multiplication practice app** designed to help kids practice their multiplication tables. It provides a playful, edutainment-style learning experience with features like multiple-choice questions, animations, and score tracking.

The app allows users to select which multiplication tables they want to practice, as well as how many questions they would like to be asked. The questions are presented in a game-like manner with animations to make learning more engaging and enjoyable.

## Features

- **Multiplication Table Selection**: Users can choose a multiplication table (from 2 to 12) to focus on.
- **Multiple-Choice Questions**: Each question comes with four possible answers, allowing the user to pick the correct one.
- **Question Limit**: Users can select between 5, 10, or 20 questions per game.
- **Animations**: 
  - Correct answers trigger a **3D flip animation**.
  - Wrong answers give a **tilt effect**, and the correct answer is highlighted.
- **Progress Tracking**: A progress bar tracks the number of questions answered, motivating users to complete the game.
- **Score Tracking**: The app keeps track of the score and shows the user’s final score when the game ends.
- **Reset Option**: At the end of the game, users can reset the game and start over with a new set of questions.

## Technologies Used

- **SwiftUI**: For building the user interface and managing views.
- **State Management**: Used to manage game state, including the current question, user’s score, and game mode.
- **Animations**: SwiftUI’s built-in animations for smooth and engaging UI transitions.
  
## What I Learned

- **SwiftUI Animations**: Implementing interactive animations such as 3D rotations and tilting effects based on user input.
- **UI Design**: Creating an intuitive and engaging user experience for kids.
- **State Management**: Managing game logic and state transitions between questions.
- **Layout and Composition**: Using SwiftUI components like `Form`, `ProgressView`, and `Button` to build a dynamic and user-friendly interface.

## How to Play

1. **Choose a Multiplication Table**: Use the stepper to select which multiplication table you want to practice (e.g., table of 2).
2. **Select the Number of Questions**: Choose how many questions you’d like to answer: 5, 10, or 20.
3. **Answer the Questions**: Each question will show a multiplication equation, and you’ll be presented with four answer options. Tap the correct answer.
4. **See Instant Feedback**: 
    - A correct answer will flip the option card with a satisfying animation.
    - A wrong answer will tilt the option card and highlight the correct answer.
5. **Track Your Progress**: Watch your score and the number of completed questions on the progress tracker.
6. **Complete the Game**: After all questions have been answered, you’ll see your final score. You can then restart the game and play again!


## Installation

To run the app, clone this repository and open the project in Xcode. The app is written in SwiftUI, so it requires **Xcode 12** or later.

```bash
git clone https://github.com/yourusername/multiplication-practice-app.git
