import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var questionCounter = 0
    @State private var endGame = false
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                Gradient.Stop(color: .gray, location: 0.3),
                Gradient.Stop(color: Color(red: 0.26, green: 0.63, blue: 0.80), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
//                    .font(.largeTitle.bold())
//                    .foregroundStyle(.white)
                    .largeBlueTitle()
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button() {
                            flagTapped(number)
                        } label: {
                            FlagImage(countries[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
            .alert("Game Over", isPresented: $endGame) {
                Button("Restart Game", role: .destructive, action: restartGame)
            } message: {
                Text("You reached the end of the game! Final score: \(score)")
            }
            
        }.alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong! \n That's the flag of \(countries[number])"
            score -= 1
        }
        showingScore = true
    }
    
    func askQuestion() {
        if questionCounter >= 8 {
            endGame = true
        } else {
            countries.shuffle()
            correctAnswer = Int.random(in: 0..<3)
            questionCounter += 1
        }
        
    }
    
    func restartGame(){
        score = 0
        questionCounter = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0..<3)
        endGame = false
    }
}

struct FlagImage: View {
    var country: String

    init(_ country: String) {
        self.country = country
    }
    var body: some View {
        Image(country)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}


struct CustomTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.blue)
    }
}

extension View {
    func largeBlueTitle() -> some View {
        modifier(CustomTitle())
    }
}

#Preview {
    ContentView()
}
