import SwiftUI

struct ContentView: View {
    
    var choices: [ChoiceType] = [.rock, .paper, .scissors]
    
    var body: some View {
        VStack{
            VStack {
                Text("🪨Rock 📄Paper ✂️Scissors")
                    .font(.title)
                
                Text("Computer's choice")
                    .font(.title)
                    .padding(.top, 50)
            }
            .padding()
            
            GameChoice(.rock)
                .padding(100)
            
            
            HStack(spacing: 10){
                ForEach(choices, id: \.self){ choice in
                    GameChoice(choice)
                }
            }
            .padding(.bottom, 100)
        }
    }
}

#Preview {
    ContentView()
}


