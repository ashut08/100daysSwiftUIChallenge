//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ashutosh Singh on 26/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var scoreTitle = ""
    @State private var alertMessage = " "
    @State private var showingScore = false
    @State private var  countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    @State private var  correctAnswer = Int.random(in: 0...2)
    @State private var score=0

    @State private var questionCount = 0
      @State private var gameOver = false
    
    var body: some View {
        ZStack{ 
            RadialGradient(stops: [
                .init(color: .blue, location: 0.3),
                .init(color: .red, location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
       
            VStack{
                Spacer()
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                VStack(spacing: 15) {
                
                VStack {
                    Text("Tap the flag of" ) .foregroundStyle(.black).font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer]) .foregroundStyle(.black).font(.largeTitle .weight(.semibold))
                }
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number]) .clipShape(.capsule
                        )
                            .shadow(radius: 5)
                    }
                }
            }.frame(maxWidth: .infinity)
                    .padding(20)
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius: 20)).padding(20)
                Spacer()
                Spacer()
                ProgressView(value: Double(questionCount), total: 8) {
                               Text("Question \(questionCount) of 8")
                                   .font(.headline) // Customize the font style
                                   .foregroundColor(.white) // Customize the text color
                                   .padding(.bottom, 5) // Add some spacing between text and progress bar
                           }
                .progressViewStyle(LinearProgressViewStyle(tint: .purple ))
                                  .padding() .tint(.white)
                Text("Score:\(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
            }
        } .ignoresSafeArea()
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text(alertMessage) // Use alertMessage to show the correct message
            
        }.alert("Game Over", isPresented: $gameOver) {
            Button("Restart", action: resetGame)
        } message: {
            Text("Final score: \(score)/8. Great job!")
        }
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            
            score+=1;
            alertMessage = "Your score is \(score)."
        } else {
            alertMessage = "Wrong! That’s the flag of \(countries[number]). Your score is \(score)."

            scoreTitle = "Wrong"
            
        }

        showingScore = true
    }
    func askQuestion() {
            if questionCount == 8 {
                gameOver = true
            } else {
                countries.shuffle()
                correctAnswer = Int.random(in: 0...2)
                questionCount += 1
            }
        }
        
        func resetGame() {
            score = 0
            questionCount = 0
            askQuestion()
        }
}
    

#Preview {
    ContentView()
}
