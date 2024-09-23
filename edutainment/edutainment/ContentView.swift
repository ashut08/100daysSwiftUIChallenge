import SwiftUI

struct ContentView: View {
    struct Question {
        let text: String
        let answer: Int
        let options: [Int]
    }
    
    @State private var multiplicationTable = 2
    @State private var numberOfQuestions = 5
    @State private var questions: [Question] = []
    @State private var ingameMode = false
    @State private var currentQuestionIndex = 0
    @State private var showingAnswer = false
    @State private var userAnswerCorrect = false
    @State private var selectedOption: Int? = nil
    @State private var score = 0
    @State private var scoreAnimation = false
    @State private var isGameOver = false
    @State private var flipAmount = 0.0
    @State private var tiltAmount = 0.0
    @State private var animateOptions = false;
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    if ingameMode {
                        QuestionView(
                            question: questions[currentQuestionIndex],
                            onAnswerSelected: answerSelected,
                            round: currentQuestionIndex,
                            totalQuestion: numberOfQuestions,
                            flipAmount: flipAmount,
                            tiltAmount: tiltAmount,
                            selectedOption: selectedOption ?? -1,
                            userAnswerCorrect: userAnswerCorrect
                        
                        )
                        
                        Text("Score: \(score)")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                            .padding()
                            .scaleEffect(scoreAnimation ? 1.2 : 1)
                            .animation(.spring(), value: score)
                    } else {
                        // Game settings view
                        Text("Multiplication Practice")
                            .font(.largeTitle.weight(.bold))
                            .foregroundColor(.white)
                        
                        Form {
                            Section("Select the multiplication table:") {
                                Stepper("Table of \(multiplicationTable)", value: $multiplicationTable, in: 2...12)
                            }
                            
                            Section("Number of questions") {
                                Picker("Questions", selection: $numberOfQuestions) {
                                    Text("5").tag(5)
                                    Text("10").tag(10)
                                    Text("20").tag(20)
                                }
                                .pickerStyle(SegmentedPickerStyle())
                            }
                        }
                        .background(Color.white.opacity(0.8))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding()
                        
                        Button("Start Game") {
                            generateQuestion()
                        }
                        .font(.title2)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 5)
                    }
                }
                .alert(isPresented: $isGameOver) {
                    Alert(
                        title: Text("Game Over 🎉").font(.largeTitle),
                        message: Text("Your final score is \(score)"),
                        dismissButton: .default(Text("Play Again"), action: resetGame)
                    )
                }
            }
        }
        .navigationTitle("Tables")
    }
    
    func generateQuestion() {
        animateOptions=true
        questions.removeAll()
        for _ in 1...numberOfQuestions {
            let randomMultiplier = Int.random(in: 1...10)
            let text = "Multiplication of \(multiplicationTable) * \(randomMultiplier)"
            let answer = randomMultiplier * multiplicationTable
            var options = [answer]
            while options.count < 4 {
                let randomOption = Int.random(in: 1...(multiplicationTable * 12))
                if !options.contains(randomOption) {
                    options.append(randomOption)
                }
            }
            options.shuffle()
            questions.append(Question(text: text, answer: answer, options: options))
        }
        ingameMode = true
    }
    
    func answerSelected(_ selectedOption: Int) {
        self.selectedOption = selectedOption
        let currentQuestion = questions[currentQuestionIndex]
        userAnswerCorrect = selectedOption == currentQuestion.answer
        showingAnswer = true
        
        if userAnswerCorrect {
            withAnimation(.easeInOut(duration: 0.6)) {
                       flipAmount += 180
                   }
            score += 1
            scoreAnimation = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                scoreAnimation = false
                nextQuestion()
            }
        } else {
            withAnimation {
                      tiltAmount += 20
                  }
            nextQuestion()
        }
    }
    
    func nextQuestion() {
 
        if currentQuestionIndex + 1 < questions.count {
            currentQuestionIndex += 1
            animateOptions = true
        } else {
            ingameMode = false
            isGameOver = true
            animateOptions = false
        }
        // Reset animations
        selectedOption = nil
        flipAmount = 0
        tiltAmount = 0
    }
    
    func resetGame() {
        animateOptions = false
        ingameMode = false
        isGameOver = false
        currentQuestionIndex = 0
        score = 0
    }
}

#Preview {
    ContentView()
}
