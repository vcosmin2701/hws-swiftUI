import SwiftUI

struct ContentView: View {
    var choices = ["newspaper", "mountain.2", "scissors"]
    
    var body: some View {
        VStack{
            VStack {
                Text("Title of the game")
                
                Text("Computer")
            }
            
            Image(systemName: choices[0])
            
            HStack(spacing: 20){
                Image(systemName: choices[0])
                Image(systemName: choices[1])
                Image(systemName: choices[2])
            }
        }
    }
}

#Preview {
    ContentView()
}
