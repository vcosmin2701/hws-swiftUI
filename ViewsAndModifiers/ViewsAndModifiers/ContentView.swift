import SwiftUI

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct ContentView: View {
    var body: some View {
            VStack(spacing: 10) {
                CapsuleText(text: "First")
                CapsuleText(text: "Second")
            }
        }
}

#Preview {
    ContentView()
}
