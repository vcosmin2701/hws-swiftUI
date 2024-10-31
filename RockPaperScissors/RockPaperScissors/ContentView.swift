import SwiftUI

struct ContentView: View {
    
    var choices: [ChoiceType] = [.rock, .paper, .scissors]
    
    var body: some View {
        VStack{
            VStack {
                Text("Title of the game")
                
                Text("Computer")
            }
            .padding()
            
            GameChoice(.rock)
            
            
            HStack(spacing: 10){
                ForEach(choices, id: \.self){ choice in
                    GameChoice(choice)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


