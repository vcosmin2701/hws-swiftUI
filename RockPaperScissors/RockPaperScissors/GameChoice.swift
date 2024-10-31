import SwiftUI

struct GameChoice: View {
    var text: String
    
    private var gradient = Gradient(colors: [
        Color(.blue),
        Color(.indigo)
    ])
    
    init(_ text: String) {
        self.text = text
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
                Image(systemName: text)
            }
        }
        .font(.system(size: 30))
        .foregroundStyle(.white)
    }
}
