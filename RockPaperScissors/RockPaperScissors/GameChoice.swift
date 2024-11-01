import SwiftUI

struct GameChoice: View {
    var currentChoice: String
    
    private var gradient = Gradient(colors: [
        Color(.blue),
        Color(.indigo)
    ])
    
    init(_ choice: String){
        self.currentChoice = choice
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    RadialGradient(
                        gradient: gradient,
                        center: .center,
                        startRadius: 1,
                        endRadius: 100
                    )
                )
                .frame(width: 100, height: 100)
            
            Text(currentChoice)
                .font(.largeTitle)
        }
        .font(.system(size: 30))
        .foregroundStyle(.white)
    }
}

