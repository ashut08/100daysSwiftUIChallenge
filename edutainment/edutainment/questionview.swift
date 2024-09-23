import Foundation
import SwiftUI

struct QuestionView: View {
    let question: ContentView.Question
    let onAnswerSelected: (Int) -> Void
    let round: Int
    let totalQuestion: Int
    let flipAmount: Double
    let tiltAmount: Double
    let selectedOption: Int
    let userAnswerCorrect: Bool
    
    @State private var animateOptions = false

    var body: some View {
        VStack {
            Text("Question \(round + 1) of \(totalQuestion)")
                .font(.title2.weight(.bold))
                .foregroundColor(.white)
                .padding()
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [.purple, .blue]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .clipShape(Capsule())
                )
            
            Text(question.text)
                .font(.largeTitle)
                .foregroundColor(.white)
            
            ForEach(question.options, id: \.self) { option in
                Button {
                    onAnswerSelected(option)
                } label: {
                    Text("\(option)")
                        .font(.title3)
                        .padding()
                        .frame(minWidth: 100)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: userAnswerCorrect && selectedOption == option ? [.green, .green] : !userAnswerCorrect && selectedOption == option ? [.red, .red] : [.purple, .blue]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .rotation3DEffect(.degrees(selectedOption == option && userAnswerCorrect ? flipAmount : 0), axis: (x: 0, y: 1, z: 0))
                        .rotationEffect(.degrees(selectedOption == option && !userAnswerCorrect ? tiltAmount : 0))
                        .scaleEffect(animateOptions ? 1.0 : 0.5) // Scale from 0.5 to 1
                        .opacity(animateOptions ? 1 : 0)        // Fade in from opacity 0 to 1
                        .animation(.easeIn(duration: 0.5), value: animateOptions)
                }
            }
            
            ProgressView(value: Double(round + 1), total: Double(totalQuestion))
                .progressViewStyle(LinearProgressViewStyle(tint: .purple))
                .background(.white)
                .scaleEffect(x: 1, y: 3)
                .cornerRadius(20)
                .frame(height: 40)
                .padding()
        }
        .padding()
        .onAppear {
            animateOptions = false // Reset the animation when view appears
            withAnimation {
                animateOptions = true // Re-trigger the animation when the view appears
            }
        }
        .onChange(of: round) { _ in
            // Trigger the animation when the round (question) changes
            animateOptions = false
            withAnimation {
                animateOptions = true
            }
        }
    }
}
