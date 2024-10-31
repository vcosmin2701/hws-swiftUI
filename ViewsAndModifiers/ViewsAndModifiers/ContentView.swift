import SwiftUI

struct ContentView: View {
    var motto1: some View {
        Text("Apple Team is the best")
    }
    
    let motto2 = Text("Agile Freaks")
    
    @ViewBuilder var platforms: some View {
        Text("iOS")
        Text("macOS")
    }
    
    var body: some View {
        VStack {
            motto1
                .foregroundStyle(.red)
            motto2
                .foregroundStyle(.blue)
        }
    }
}

#Preview {
    ContentView()
}
