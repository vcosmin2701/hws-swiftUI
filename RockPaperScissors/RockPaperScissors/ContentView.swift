import SwiftUI

struct ContentView: View {
    
    var choices: [ChoiceType] = [.rock, .paper, .scissors]
    @State private var computerChoice: ChoiceType = .rock
    @State private var playerChoice: ChoiceType?
    @State private var resultMessage: String = ""
    @State private var playerTurn: Bool = true
    @State private var showAlert: Bool = false
    
    var body: some View {
        VStack {
            Text("🪨Rock 📄Paper ✂️Scissors")
                .font(.title)
                .padding()
            
            VStack {
                if playerTurn {
                    Text("Your turn: Make a choice")
                        .font(.title2)
                } else {
                    Text("Computer's choice")
                        .font(.title)
                        .padding(.top, 20)
                    
                    Text(computerChoice.rawValue)
                        .font(.system(size: 100))
                }
            }
            
            Text(resultMessage)
                .font(.title2)
                .padding()
            
            HStack(spacing: 20) {
                ForEach(choices, id: \.self) { choice in
                    GameChoice(choice.rawValue)
                        .onTapGesture {
                            if playerTurn { playGame(with: choice) }
                        }
                }
            }
            .padding(.top, 20)
            
            if !playerTurn {
                Button("Play Again") {
                    resetGame()
                }
                .font(.title2)
                .padding(.top, 20)
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Game Over"),
                message: Text(resultMessage),
                primaryButton: .default(Text("Play Again")) {
                    resetGame()
                },
                secondaryButton: .cancel()
            )
        }
    }
    
    func playGame(with playerChoice: ChoiceType) {
        self.playerChoice = playerChoice
        computerChoice = choices.randomElement() ?? .rock
        
        if playerChoice == computerChoice {
            resultMessage = "It's a tie!"
        } else if playerChoice.beats(computerChoice) {
            resultMessage = "You Won! Computer had: \(computerChoice.rawValue)"
        } else {
            resultMessage = "You Lost! Computer had \(computerChoice.rawValue)"
        }
        
        playerTurn = false
        showAlert = true
    }
    
    func resetGame() {
        playerChoice = nil
        computerChoice = .rock
        resultMessage = ""
        playerTurn = true
        showAlert = false
    }
}

#Preview {
    ContentView()
}


