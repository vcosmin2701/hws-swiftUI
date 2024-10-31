import SwiftUI

struct ContentView: View {
    var choices = ["newspaper", "mountain.2", "scissors"]
    
    var body: some View {
        VStack{
            VStack {
                Text("Title of the game")
                
                Text("Computer")
            }
            
            GameChoice(choices[0])
            
            HStack(spacing: 10){
                ForEach(0..<3){
                    GameChoice(choices[$0])
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


