import SwiftUI

struct ContentView: View {
    struct Move {
        let name: String
        let systemImageName: String
    }
    
    let moves = [
        Move(name: "Rock", systemImageName: "square.fill"),
        Move(name: "Paper", systemImageName: "doc.fill"),
        Move(name: "Scissors", systemImageName: "scissors")
    ]
    
    @State private var appMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var playerScore = 0
    @State private var roundCount = 1
    @State private var showingFinalScore = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]),
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Round \(roundCount) of 10")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text("App chose: \(moves[appMove].name)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(shouldWin ? "You need to WIN" : "You need to LOSE")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(shouldWin ? .green : .red)
                    .padding(.vertical)
                
                Spacer()
                
                HStack(spacing: 20) {
                    ForEach(0..<3) { number in
                        Button(action: {
                            playerTapped(move: number)
                        }) {
                            VStack {
                                Image(systemName: moves[number].systemImageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.white)
                                    .shadow(radius: 5)
                                
                                Text(moves[number].name)
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .background(Color.black.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }.padding(30)
                
                Spacer()
                
                Text("Score: \(playerScore)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
        }
        .alert(isPresented: $showingFinalScore) {
            Alert(title: Text("Game Over"),
                  message: Text("Your final score is \(playerScore)"),
                  dismissButton: .default(Text("Play Again")) {
                    resetGame()
                  })
        }
    }
    
    func playerTapped(move: Int) {
        if roundCount == 10 {
            showingFinalScore = true
            return
        }
        
        let winningMoves = ["Paper", "Scissors", "Rock"]
        let playerWins: Bool
        
        if shouldWin {
            playerWins = moves[move].name == winningMoves[appMove]
        } else {
            playerWins = moves[move].name != winningMoves[appMove]
        }
        
        if playerWins {
            playerScore += 1
        }
        
        roundCount += 1
        appMove = Int.random(in: 0...2)
        shouldWin.toggle()
    }
    
    func resetGame() {
        playerScore = 0
        roundCount = 1
        appMove = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

