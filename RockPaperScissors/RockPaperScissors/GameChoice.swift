import SwiftUI

struct GameChoice: View {
    private var choices = ["newspaper", "mountain.2", "scissors"]
    var currentChoice: ChoiceType
    
    private var gradient = Gradient(colors: [
        Color(.blue),
        Color(.indigo)
    ])
    
    private var imageName: String {
        switch currentChoice {
        case .rock:
            "mountain.2"
        case .paper:
            "newspaper"
        case .scissors:
            "scissors"
        }
    }
    
    init(_ choice: ChoiceType){
        self.currentChoice = choice
    }
    
    var body: some View {
        Button {
            print("tapped")
        } label: {
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
                
                Image(systemName: imageName)
            }
        }
        .font(.system(size: 30))
        .foregroundStyle(.white)
    }
}
